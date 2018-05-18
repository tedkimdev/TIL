Namespace in Swift
==================

Generic Name Space
------------------
```swift
struct MyNameSpace<T> {
    private let base: T
    init(with base: T) {
        self.base = base
    }
}
extension MyNameSpace where T: UIButton {
    func hello () {
        let title = self.base.title(for: .normal) ?? ""
        print ("Hello \(title)")
    }
}
extension UIButton {
    var myNameSpace: MyNameSpace<UIButton> {
        return MyNameSpace(with: self)
    }
}
let myButton = UIButton()
myButton.setTitle("My button", for: .normal)
myButton.myNameSpace.hello()



extension UIImage {
    var myNameSpace: MyNameSpace<UIImage> {
        return MyNameSpace(with: self)
    }
}
extension MyNameSpace where T: UIImage {
    func hello () {
        let title = self.base.accessibilityHint ?? ""
        print ("Hello \(title)")
    }
}
let myImage = UIImage()
myImage.accessibilityHint = "My Image"
myImage.myNameSpace.hello()

```

Ref
---
https://github.com/ReactiveX/RxSwift/blob/0b66f666ba6955a51cba1ad530311b030fa4db9c/RxSwift/Reactive.swift
