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



Example
-------
```objective-c

#import <Foundation/Foundation.h>
#import "UnityAppController.h"


@interface OverrideAppDelegate : UnityAppController
@end


IMPL_APP_CONTROLLER_SUBCLASS(OverrideAppDelegate)


@implementation OverrideAppDelegate


-(BOOL)application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) options
{
//    NSLog(@"[OverrideAppDelegate application:%@ didFinishLaunchingWithOptions:%@]", application, options);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@"%@",fileManager);
    
    NSString *folderName = @"Images";
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [documentPaths objectAtIndex:0];
    NSString *fullFolderPath = [documentsDirectoryPath stringByAppendingPathComponent:folderName];
    
//    NSLog(@"%@", documentsDirectoryPath);
//    NSLog(@"%@", fullFolderPath);
    
    //check images directory
    
    BOOL isDir;
    BOOL exists = [fileManager fileExistsAtPath:fullFolderPath isDirectory:&isDir];
    if (exists) {
        /* file exists */
        if (isDir) {
            /* file is a directory */
            NSLog(@"image folder exists.");
        }
    } else {
        // Make directory...
        NSError *error = nil;
        BOOL success = [fileManager createDirectoryAtPath:fullFolderPath withIntermediateDirectories:YES attributes:nil error:&error];
        if(success) {
            NSLog(@"images directory created");
        }
    }
    
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:fullFolderPath
        error:NULL];
    
    NSMutableArray *imgFiles = [[NSMutableArray alloc] init];
    [dirs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *filename = (NSString *)obj;
        NSString *extension = [[filename pathExtension] lowercaseString];
//        NSLog(@"%@", filename);
        if ([extension isEqualToString:@"png"]) {
//            NSLog(@"%@", filename);
            [imgFiles addObject:[fullFolderPath stringByAppendingPathComponent:filename]];
        }
    }];
    
    
    // CHECK Image Data from... Containing App Document Folder
    NSURL *groupURL = [fileManager containerURLForSecurityApplicationGroupIdentifier:@"group.com.mira.share"];
    
    NSURL *containerAppSourcePathURL = [groupURL URLByAppendingPathComponent:@"File Provider Storage"];
    NSString *containerAppSourcePath = [containerAppSourcePathURL path];

    NSArray *keys = [NSArray arrayWithObject:NSURLIsDirectoryKey];
    
    NSDirectoryEnumerator *enumerator = [fileManager
                                         enumeratorAtURL: containerAppSourcePathURL
                                         includingPropertiesForKeys:keys
                                         options:0
                                         errorHandler:^(NSURL *url, NSError *error) {
                                             // Handle the error.
                                             // Return YES if the enumeration should continue after the error.
                                             return YES;
                                         }];
    
    //Save files to its document folder
    for (NSURL *url in enumerator) {
        NSError *error;
        NSNumber *isDirectory = nil;
        if (! [url getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&error]) {
            // handle error
        }
        else if (! [isDirectory boolValue]) {
            // No error and it’s not a directory; do something with the file
//            NSLog(@"%@", url);
//            NSLog(@"%@", [url lastPathComponent]);
            
            NSData * imageData = [[NSData alloc] initWithContentsOfFile:url];
            if ( imageData != nil ) {
                // Save data in document/images directory
                UIImage *image = [UIImage imageWithData:imageData];
                NSString *imagePath = [fullFolderPath stringByAppendingPathComponent: [url lastPathComponent]];
//                NSLog(imagePath);
                if (![imageData writeToFile:imagePath atomically:false])
                {
                    NSLog(@"Failed to image data to disk");
                }
                else
                {
                    NSLog(@"the Image Path is %@",imagePath);
                }
            }
        }
    }
    
    //TODO: Delete files in containg app directory
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDirectoryEnumerator* en = [fm enumeratorAtPath: containerAppSourcePath];
    NSError *err = nil;
    BOOL res;
    
    NSString *file;
    while(file = [en nextObject]) {
        res = [fm removeItemAtPath:[containerAppSourcePath stringByAppendingPathComponent:file] error:&err];
        if (!res && err) {
            NSLog(@"oops: %@", err);
        }
    }
    
    return [super application:application didFinishLaunchingWithOptions:options];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"[OverrideAppDelegate applicationWillEnterForeground:%@]", application);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@"%@",fileManager);
    
    NSString *folderName = @"Images";
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [documentPaths objectAtIndex:0];
    NSString *fullFolderPath = [documentsDirectoryPath stringByAppendingPathComponent:folderName];
    
    //    NSLog(@"%@", documentsDirectoryPath);
    //    NSLog(@"%@", fullFolderPath);
    
    //check images directory
    
    BOOL isDir;
    BOOL exists = [fileManager fileExistsAtPath:fullFolderPath isDirectory:&isDir];
    if (exists) {
        /* file exists */
        if (isDir) {
            /* file is a directory */
            NSLog(@"image folder exists.");
        }
    } else {
        // Make directory...
        NSError *error = nil;
        BOOL success = [fileManager createDirectoryAtPath:fullFolderPath withIntermediateDirectories:YES attributes:nil error:&error];
        if(success) {
            NSLog(@"images directory created");
        }
    }
    
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:fullFolderPath
                                                                        error:NULL];
    
    NSMutableArray *imgFiles = [[NSMutableArray alloc] init];
    [dirs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *filename = (NSString *)obj;
        NSString *extension = [[filename pathExtension] lowercaseString];
        //        NSLog(@"%@", filename);
        if ([extension isEqualToString:@"png"]) {
            //            NSLog(@"%@", filename);
            [imgFiles addObject:[fullFolderPath stringByAppendingPathComponent:filename]];
        }
    }];
    
    
    // CHECK Image Data from... Containing App Document Folder
    NSURL *groupURL = [fileManager containerURLForSecurityApplicationGroupIdentifier:@"group.com.mira.share"];
    
    NSURL *containerAppSourcePathURL = [groupURL URLByAppendingPathComponent:@"File Provider Storage"];
    NSString *containerAppSourcePath = [containerAppSourcePathURL path];
    
    NSArray *keys = [NSArray arrayWithObject:NSURLIsDirectoryKey];
    
    NSDirectoryEnumerator *enumerator = [fileManager
                                         enumeratorAtURL: containerAppSourcePathURL
                                         includingPropertiesForKeys:keys
                                         options:0
                                         errorHandler:^(NSURL *url, NSError *error) {
                                             // Handle the error.
                                             // Return YES if the enumeration should continue after the error.
                                             return YES;
                                         }];
    
    //Save files to its document folder
    for (NSURL *url in enumerator) {
        NSError *error;
        NSNumber *isDirectory = nil;
        if (! [url getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&error]) {
            // handle error
        }
        else if (! [isDirectory boolValue]) {
            // No error and it’s not a directory; do something with the file
            //            NSLog(@"%@", url);
            //            NSLog(@"%@", [url lastPathComponent]);
            
            NSData * imageData = [[NSData alloc] initWithContentsOfFile:url];
            if ( imageData != nil ) {
                // Save data in document/images directory
                UIImage *image = [UIImage imageWithData:imageData];
                NSString *imagePath = [fullFolderPath stringByAppendingPathComponent: [url lastPathComponent]];
                //                NSLog(imagePath);
                if (![imageData writeToFile:imagePath atomically:false])
                {
                    NSLog(@"Failed to image data to disk");
                }
                else
                {
                    NSLog(@"the Image Path is %@",imagePath);
                }
            }
        }
    }
    
    //TODO: Delete files in containg app directory
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDirectoryEnumerator* en = [fm enumeratorAtPath: containerAppSourcePath];
    NSError *err = nil;
    BOOL res;
    
    NSString *file;
    while(file = [en nextObject]) {
        res = [fm removeItemAtPath:[containerAppSourcePath stringByAppendingPathComponent:file] error:&err];
        if (!res && err) {
            NSLog(@"oops: %@", err);
        }
    }
}

-(void)createDirectory:(NSString *)directoryName atFilePath:(NSString *)filePath
{
    NSString *filePathAndDirectory = [filePath stringByAppendingPathComponent:directoryName];
    NSError *error;
    
    if (![[NSFileManager defaultManager] createDirectoryAtPath:filePathAndDirectory
                                   withIntermediateDirectories:NO
                                                    attributes:nil
                                                         error:&error])
    {
        NSLog(@"Create directory error: %@", error);
    }
}

@end

```
