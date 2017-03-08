# Using Swift class inside Objective-C

####Swift classes are tagged with ```@objc``` or inherit from a class that derives (directly or indirectly) from ```NSObject```.

```swift
@objc class SwiftClassName: UIViewController
```



####In project build setting, change below flags to ```YES``` (Both Project and Target)

- Defines Module : YES
- Always Embed Swift Standard Libraries : YES
- Install Objective-C Compatibility Header : YES

####Write below flag to ```module name```
- ex) Product Module Name : $(PRODUCT_NAME:c99extidentifier)
- Product Module Name : $(TARGET_NAME)

```c99extidentifier``` means that you can supply a c99-compatible string that will stay in sync with the Target Name, as the default value does. 


Then clean the project and build once.
After build succeed, import header file in Objective-C class .m file
```objective-c
#import “ModuleName-Swift.h" 
```


####Ref
http://codeworkshop.net/posts/xcode-build-setting-transformations
