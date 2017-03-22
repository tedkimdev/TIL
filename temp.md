
```swift
import ChameleonFramework
import UIKit
import RxSwift
import RxCocoa


class CircleViewModel {
  
  var centerVariable = Variable<CGPoint?>(.zero) // Create one variable that will be changed and observed
  var backgroundColorObservable: Observable<UIColor>! // Create observable that will change backgroundColor based on center
  
  var sizeVariable = Variable<CGSize?>(.zero)
  var cornerRadiusObservable: Observable<CGFloat>!

  init() {
    setup()
  }
  
  func setup() {
    // When we get new center, emit new UIColor
    backgroundColorObservable = centerVariable.asObservable()
      .map { center in
        guard let center = center else { return UIColor.flatten(.black)() }
        
        let red: CGFloat = ((center.x + center.y).truncatingRemainder(dividingBy: 255.0)) / 255.0 // We just manipulate red, but you can do w/e
        let green: CGFloat = 0.0
        let blue: CGFloat = 0.0
        
        // When we get new center, modify size width, height
        self.sizeVariable.value?.width = center.x.truncatingRemainder(dividingBy: 100)
        self.sizeVariable.value?.height = center.y.truncatingRemainder(dividingBy: 50)
        
        return UIColor.flatten(UIColor(red: red, green: green, blue: blue, alpha: 1.0))()
      }
    
    // When we get new CGSize, emit new CGFloat
    cornerRadiusObservable = sizeVariable.asObservable()
      .map{ size in
        guard let size = size, size.width > 0, size.height > 0 else { return CGFloat(0) }
        
        return (size.width / size.height)
      }
  }
  
}


class ViewController: UIViewController {

  var circleView: UIView!
  var circleViewModel: CircleViewModel!
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
    circleView.layer.cornerRadius = circleView.frame.width / 2.0
    circleView.center = view.center
    circleView.backgroundColor = .green
    view.addSubview(circleView)
    
    circleViewModel = CircleViewModel()
    // Bind the center point of the CircleView to the centerObservable
    circleView
      .rx.observe(CGPoint.self, "center")
      .bindTo(circleViewModel.centerVariable)
      .addDisposableTo(disposeBag)
    
    circleView
      .rx.observe(CGSize.self, "size")
      .bindTo(circleViewModel.sizeVariable)
      .addDisposableTo(disposeBag)
    
    // Subscribe to backgroundObservable to get new colors from the ViewModel.
    circleViewModel.backgroundColorObservable
      .subscribe(onNext: { [weak self] backgroundColor in
        UIView.animate(withDuration: 0.1) {
          self?.circleView.backgroundColor = backgroundColor
          // Try to get complementary color for given background color
          let viewBackgroundColor = UIColor(complementaryFlatColorOf: backgroundColor)
          // If it is different that the color
          if viewBackgroundColor != backgroundColor {
            // Assign it as a background color of the view
            // We only want different color to be able to see that circle in a view
            self?.view.backgroundColor = viewBackgroundColor
          }
        }
      })
      .addDisposableTo(disposeBag)
    
    //size
    circleViewModel.sizeVariable.asObservable()
      .subscribe(onNext: { [weak self] size in
        if let size = size {
          self?.circleView.frame.size = size
        }
      }).addDisposableTo(disposeBag)
    
    //cornerRadius
    circleViewModel.cornerRadiusObservable
      .subscribe(onNext: { [weak self] cornerRadius in
          self?.circleView.layer.cornerRadius = cornerRadius
      }).addDisposableTo(disposeBag)
    
    // Add gesture recognizer
    let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(_:)))
    circleView.addGestureRecognizer(gestureRecognizer)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func circleMoved(_ recognizer: UIPanGestureRecognizer) {
    let location = recognizer.location(in: self.view)
    UIView.animate(withDuration: 0.1) {
      self.circleView.center = location
    }
  }

}

```
```swift

import UIKit

import RxCocoa
import RxSwift

class ViewController: UIViewController {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  let diposeBag = DisposeBag()
  
  var shownCities = [String]() // Data source for UITableView
  let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // Our mocked API data source
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    
    self.searchBar
      .rx.text
      .orEmpty
      .debounce(0.5, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
      .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
      .filter { !$0.isEmpty } // If the new value is really new, filter for non-empty query.
      .subscribe(onNext: { [unowned self] query in // Here we subscribe to every new value
        self.shownCities = self.allCities.filter { $0.hasPrefix(query) } // We now do our "API Request" to find cities.
        self.tableView.reloadData() // And reload table view data.
      })
      .addDisposableTo(diposeBag)
    
  }

}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shownCities.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath)
    cell.textLabel?.text = shownCities[indexPath.row]
    
    return cell
  }
  
}
```
