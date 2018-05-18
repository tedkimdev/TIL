Name space in Swift
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

This is exactly the way RxSwift has implemented the rx name space.
-----------------------------------------------------------------
```swift
//
//  Reactive.swift
//  RxSwift
//
//  Created by Yury Korolev on 5/2/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//
/**
 Use `Reactive` proxy as customization point for constrained protocol extensions.
 General pattern would be:
 // 1. Extend Reactive protocol with constrain on Base
 // Read as: Reactive Extension where Base is a SomeType
 extension Reactive where Base: SomeType {
 // 2. Put any specific reactive extension for SomeType here
 }
 With this approach we can have more specialized methods and properties using
 `Base` and not just specialized on common base type.
 */

public struct Reactive<Base> {
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions.
public protocol ReactiveCompatible {
    /// Extended type
    associatedtype CompatibleType

    /// Reactive extensions.
    static var rx: Reactive<CompatibleType>.Type { get set }

    /// Reactive extensions.
    var rx: Reactive<CompatibleType> { get set }
}

extension ReactiveCompatible {
    /// Reactive extensions.
    public static var rx: Reactive<Self>.Type {
        get {
            return Reactive<Self>.self
        }
        set {
            // this enables using Reactive to "mutate" base type
        }
    }

    /// Reactive extensions.
    public var rx: Reactive<Self> {
        get {
            return Reactive(self)
        }
        set {
            // this enables using Reactive to "mutate" base object
        }
    }
}

import class Foundation.NSObject

/// Extend NSObject with `rx` proxy.
extension NSObject: ReactiveCompatible { }
```
Ref
---
https://github.com/ReactiveX/RxSwift/blob/0b66f666ba6955a51cba1ad530311b030fa4db9c/RxSwift/Reactive.swift
