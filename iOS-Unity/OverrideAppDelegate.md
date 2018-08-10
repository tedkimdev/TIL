How to override app delegate in Unity for iOS
---------------------------------------------

- put this file OverrideAppDelegate.m into your Plugins folder
```objective-c
#import "UnityAppController.h"
@interface OverrideAppDelegate : UnityAppController
@end
IMPL_APP_CONTROLLER_SUBCLASS(OverrideAppDelegate)
@implementation OverrideAppDelegate
-(BOOL)application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) options
{
    NSLog(@"[OverrideAppDelegate application:%@ didFinishLaunchingWithOptions:%@]", application, options);
    return [super application:application didFinishLaunchingWithOptions:options];
}
@end
```
