Failable Initialization
=======================


```swift
public struct Particle { 
    private var name: String 
    private var symbol: String 
    private var statistics: String 
    private var image: NSImage 
} 
 
extension Particle{ 
    // Initializers 
    init?(name: String, symbol: String, statistics: String,
    imageName: String){ 
         
        self.name = name 
        self.symbol = symbol 
        self.statistics = statistics 
        if let image = NSImage(named: imageName){ 
            print("initialization succeeded") 
            self.image = image 
        } 
        else { 
            print("initialization failed") 
            return nil 
        } 
    } 
} 
 
 
var quarkParticle = Particle(name: "Quark", symbol: "q", statistics: "Fermionic", imageName: "QuarkImage.tiff") 
 
// quarkParticle is nill because the image file named "QuarkImage" 
// was not found when trying to initialize the object. 
```

Single Responsibility Principal 
- a class should have only one responsibility, it should have one and only one potential reason to change

Open/Closed Principal
- software entities should be open for extension, but closed for modification

Liskov Substition Principal
- derived classes must be substitutable with their base classes

Interface Segregation Principal
- many client specific interfaces are better than a singular general purpose one

Dependency Inversion Principal
- depend on abstractions, not on concretions

In this example, we're violating the SOLID principals of Single Responsibility and Dependency Inversion

because we're coupling our structure to know about NSImage classes, handling the creation of them during initialization,

and opening up the potential to be affected by external changes in the NSImage class. 

We've also hidden from the user that we have a dependency on NSImage for representing images.


A better implementation 
------------------------
is to get the initializer to handle the creation of the image 

and let the structure manage any errors within NSImage using an accessor function, as in this example:



```swift
public struct Particle { 
    private var name: String 
    private var symbol: String 
    private var statistics: String 
    private var image: NSImage 

    public init(name: String, symbol: String, statistics: String,
    image: NSImage){ 
        self.name = name 
        self.symbol = symbol 
        self.statistics = statistics 
        self.image = image 
    } 
} 
 
extension Particle{ 
    public func particalAsImage() -> NSImage { 
        return self.image 
    } 
} 
 
var aURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Quark_structure_pion.svg/2000px-Quark_structure_pion.svg.png") 
let anImage = NSImage(contentsOfURL: aURL!) 
 
var quarkParticle = Particle(name: "Quark", symbol: "q", statistics: "Fermionic", image: anImage!) 
let quarkImage = quarkParticle.particalAsImage() 

```
