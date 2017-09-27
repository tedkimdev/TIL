
```swift
import UIKit

@IBDesignable
public final class DeluxeButton: UIControl {
  
  //MARK: public properties
  
  @IBInspectable
  public var pressedBackgroundColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
  
  @IBInspectable
  public var unpressedBackgroundColor: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) {
    didSet {
      self.backgroundColor = unpressedBackgroundColor
    }
  }
  
  
  //MARK: fileprivate UI
  
  fileprivate let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  fileprivate let label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(
      ofSize: 40,
      weight: UIFont.Weight.heavy
    )
    label.textAlignment = .center
    label.textColor = .white
    label.adjustsFontSizeToFitWidth = true
    return label
  }()
  
  fileprivate lazy var stackView: UIStackView = {
    let stackView = UIStackView (arrangedSubviews: [self.imageView, self.label])
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.isUserInteractionEnabled = false
    return stackView
  }()
  
  
  //MARK: Initializing
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.initPhase2()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initPhase2()
  }
  
  
  private func initPhase2() {
    self.label.backgroundColor = self.tintColor
    self.layer.borderColor = self.tintColor.cgColor
    self.layer.cornerRadius = 20
    
    self.addSubview(self.stackView)
    NSLayoutConstraint.activate([
      self.stackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
      self.stackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
      self.stackView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor),
      self.stackView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor),
      self.label.heightAnchor.constraint(
        equalTo: self.heightAnchor,
        multiplier: 0.3
      ),
      
    ])
  }
  
}


public extension DeluxeButton {
  
  @IBInspectable
  var image: UIImage? {
    get {
      return self.imageView.image
    }
    set {
      self.imageView.image = newValue?.withRenderingMode(.alwaysTemplate)
    }
  }
  
  @IBInspectable
  var text: String? {
    get {
      return self.label.text
    }
    set {
      self.label.text = newValue
    }
  }
  
  @IBInspectable
  var borderWidth: CGFloat {
    get {
      return self.layer.borderWidth
    }
    set {
      self.layoutMargins = UIEdgeInsets(
        top: newValue,
        left: newValue,
        bottom: newValue / 2,
        right: newValue
      )
      self.layer.borderWidth = newValue
    }
  }
  
  @IBInspectable
  var imagePadding: CGFloat {
    get {
      return self.image?.alignmentRectInsets.top ?? 0
    }
    set {
      image = image?.withAlignmentRectInsets(
        UIEdgeInsets(
          top: -newValue,
          left: -newValue,
          bottom: -newValue,
          right: -newValue
        )
      )
    }
  }
  
  
  override func tintColorDidChange() {
    self.label.backgroundColor = self.tintColor
    self.layer.borderColor = self.tintColor.cgColor
  }
  
}


//MARK: UIControl

public extension DeluxeButton {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.animate(isPressed: true)
    
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    feedbackGenerator.impactOccurred()
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    self.animate(isPressed: false)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    self.animate(isPressed: false)
  }
  
  
  //MARK: private
  
  private func animate(isPressed: Bool) {
    let (duration, backgroundColor, labelIsHidden) = {
      isPressed
        ? (
            duration: 0.05,
            backgroundColor: pressedBackgroundColor,
            labelIsHidden: true
          )
        : (
            duration: 0.1,
            backgroundColor: unpressedBackgroundColor,
            labelIsHidden: false
          )
    }()
    
    UIView.animate(withDuration: duration){
      self.backgroundColor = backgroundColor
      self.label.isHidden = labelIsHidden
    }
  }
}
```


```swift

import UIKit

@IBDesignable
class PushButton: UIButton {
  
  //MARK: Constants
  
  private struct Constants {
    static let plusLineWidth: CGFloat = 3.0
    static let plusButtonScale: CGFloat = 0.6
    static let halfPointShift: CGFloat = 0.5
  }

  
  //MARK: Properties
  
  private var halfWidth: CGFloat {
    return bounds.width / 2
  }
  
  private var halfHeight: CGFloat {
    return bounds.height / 2
  }
  
  
  //MARK: IBInspectable
  
  @IBInspectable var fillColor: UIColor = UIColor.green
  @IBInspectable var isAddButton: Bool = true
  
  
  override func draw(_ rect: CGRect) {
    let path = UIBezierPath(ovalIn: rect)
    self.fillColor.setFill()
    path.fill()
    
    //set up the width and height variables
    //for the horizontal stroke
    let plusWidth: CGFloat = min(self.bounds.width, self.bounds.height) * Constants.plusButtonScale
    let halfPlusWidth = plusWidth / 2
    
    //create the path
    let plusPath = UIBezierPath()
    
    //set the path's line width to the height of the stroke
    plusPath.lineWidth = Constants.plusLineWidth

    //move the initial point of the path
    //to the start of the horizontal stroke
    plusPath.move(to: CGPoint(
      x: halfWidth - halfPlusWidth + Constants.halfPointShift,
      y: halfHeight + Constants.halfPointShift))
    
    //add a point to the path at the end of the stroke
    plusPath.addLine(to: CGPoint(
      x: halfWidth + halfPlusWidth + Constants.halfPointShift,
      y: halfHeight + Constants.halfPointShift))
    
    //Vertical Line
    if isAddButton {
      plusPath.move(to: CGPoint(
        x: halfWidth + Constants.halfPointShift,
        y: halfHeight - halfPlusWidth + Constants.halfPointShift)
      )
      plusPath.addLine(to: CGPoint(
        x: halfWidth + Constants.halfPointShift,
        y: halfHeight + halfPlusWidth + Constants.halfPointShift)
      )
    }
    //set the stroke color
    UIColor.white.setStroke()
    
    //draw the stroke
    plusPath.stroke()
    
  }

}

```

```swift
//
//  CounterView.swift
//  CoreGraphicExample
//
//  Created by aney on 2017. 9. 26..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {
  
  //MARK: Constants
  
  private struct Constants {
    static let numberOfGlasses = 8
    static let lineWidth: CGFloat = 5.0
    static let arcWidth: CGFloat = 76
    
    static var halfOfLineWidth: CGFloat {
      return lineWidth / 2
    }
  }
  
  
  //MARK: IBInspectable
  
  @IBInspectable var counter: Int = 5 {
    didSet {
      if counter <=  Constants.numberOfGlasses {
        //the view needs to be refreshed
        setNeedsDisplay()
      }
    }
  }
  @IBInspectable var outlineColor: UIColor = UIColor.blue
  @IBInspectable var counterColor: UIColor = UIColor.orange
  
  
  override func draw(_ rect: CGRect) {
    //Arc
    let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
    let radius: CGFloat = min(self.bounds.width / 2, self.bounds.height / 2)
    let startAngle: CGFloat = 3 * .pi / 4
    let endAngle: CGFloat = .pi / 4
    let path = UIBezierPath(arcCenter: center,
                            radius: radius - Constants.arcWidth/2,
                            startAngle: startAngle,
                            endAngle: endAngle,
                            clockwise: true)
    
    path.lineWidth = Constants.arcWidth
    counterColor.setStroke()
    path.stroke()
    
    //Draw the outline
    //1 - first calculate the difference between the two angles
    //ensuring it is positive
    let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
    //then calculate the arc for each single glass
    let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
    //then multiply out by the actual glasses drunk
    let outlineEndAngle = arcLengthPerGlass * CGFloat(self.counter) + startAngle
    //2 - draw the outer arc
    let outlinePath = UIBezierPath(arcCenter: center,
                                   radius: radius - Constants.halfOfLineWidth,
                                   startAngle: startAngle,
                                   endAngle: outlineEndAngle,
                                   clockwise: true)
    
    //3 - draw the inner arc
    outlinePath.addArc(withCenter: center,
                       radius: radius - Constants.arcWidth + Constants.halfOfLineWidth,
                       startAngle: outlineEndAngle,
                       endAngle: startAngle,
                       clockwise: false)
    
    //4 - close the path
    outlinePath.close()
    
    outlineColor.setStroke()
    outlinePath.lineWidth = Constants.lineWidth
    outlinePath.stroke()
  }
  
}

```
