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
