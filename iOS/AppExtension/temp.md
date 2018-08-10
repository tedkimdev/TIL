TODO
-----
- clean source code

```swift
import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {
    
    let sharedKey = "ImageSharePhotoKey"
    
    static let appGroupIdentifier = "group.com.appname"
    static let directoryName = "File Provider Storage"
    
    
    // MARK: UI
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Bundle.main.bundlePath);
        let url = ActionViewController.appGroupContainerURL();
        print(url);
        // Get the item[s] we're handling from the extension context.
        
        // For example, look for an image and place it into an image view.
        // Replace this with something appropriate for the type[s] your extension supports.
        var imageFound = false
        for item in self.extensionContext!.inputItems as! [NSExtensionItem] {
            for provider in item.attachments! as! [NSItemProvider] {
                if provider.hasItemConformingToTypeIdentifier(kUTTypeImage as String) {
                    // This is an image. We'll load it, then place it in our image view.
                    weak var weakImageView = self.imageView
                    provider.loadItem(forTypeIdentifier: kUTTypeImage as String, options: nil, completionHandler: { (imageURL, error) in
                        OperationQueue.main.addOperation {
                            if let strongImageView = weakImageView {
                                if let imageURL = imageURL as? URL {
                                    strongImageView.image = UIImage(data: try! Data(contentsOf: imageURL))
                                }
                            }
                        }
                    })
                    
                    imageFound = true
                    break
                }
            }
            
            if (imageFound) {
                // We only handle one image, so stop looking for more.
                break
            }
        }
    }
    
    
    // MARK: IBActions
    
    @IBAction func done() {
        guard let title = titleTextField.text,
            !title.isEmpty else { return }
        
        manageImages(title)
    }
    
    func manageImages(_ fileName: String) {
        let content = extensionContext!.inputItems[0] as! NSExtensionItem
        let contentType = kUTTypeImage as String
        
        let rawImage = imageView.image
        let imgData = rawImage?.pngData()
        
        DispatchQueue.main.async {
//            let userDefaults = UserDefaults(suiteName: "group.com.mirareality.example.dfdfdf")
//            userDefaults?.set(imgData, forKey: this.sharedKey)
//            userDefaults?.synchronize()
            self.saveImageGroupContainer(image: rawImage, fileName)
            self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
        }
//        for (index, attachment) in (content.attachments as! [NSItemProvider]).enumerated() {
//            if attachment.hasItemConformingToTypeIdentifier(contentType) {
//
//                attachment.loadItem(forTypeIdentifier: contentType, options: nil) { [weak self] data, error in
//
//                    if error == nil, let url = data as? URL, let this = self {
//                        do {
//
//                            // GETTING RAW DATA
//                            let rawData = try Data(contentsOf: url)
//                            let rawImage = UIImage(data: rawData)
//                            let imgData = rawImage?.pngData()
//
//                            if index == (content.attachments?.count)! - 1 {
//                                DispatchQueue.main.async {
//
////                                    let userDefaults = UserDefaults(suiteName: "group.com.mirareality.example.dfdfdf")
////                                    userDefaults?.set(imgData, forKey: this.sharedKey)
////                                    userDefaults?.synchronize()
//
//                                    this.saveImageGroupContainer(image: rawImage, fileName)
//                                    this.extensionContext!.completeRequest(returningItems: this.extensionContext!.inputItems, completionHandler: nil)
//                                }
//                            }
//                        }
//                        catch let exp {
//                            print("GETTING EXCEPTION \(exp.localizedDescription)")
//                        }
//                    } else {
//                        print("GETTING ERROR")
//                        let alert = UIAlertController(title: "Error", message: "Error loading image", preferredStyle: .alert)
//
//                        let action = UIAlertAction(title: "Error", style: .cancel) { _ in
//                            self?.dismiss(animated: true, completion: nil)
//                        }
//
//                        alert.addAction(action)
//                        self?.present(alert, animated: true, completion: nil)
//                    }
//                }
//            }
//        }
    }
    

    func saveImageGroupContainer(image: UIImage?, _ fileName: String) {
        //1
        let fileManager = FileManager.default
        guard let groupURL = fileManager
            .containerURL(forSecurityApplicationGroupIdentifier: ActionViewController.appGroupIdentifier) else {
            return
        }
        
        guard let image = image else {
            return
        }
        
        //2
        let pathURL = groupURL.appendingPathComponent(ActionViewController.directoryName)
        let path = pathURL.path
        
        if !fileManager.fileExists(atPath: path) {
            do {
                try fileManager.createDirectory(atPath: path,
                                                withIntermediateDirectories: false,
                                                attributes: nil)
            } catch let error {
                print("error creating filepath: \(error)")
            }
        }
        
        // Save image
        print(path)
        
        if let data = image.pngData() {
            let filename = pathURL.appendingPathComponent(fileName + ".png")
            try? data.write(to: filename)
        }
    }
    
    static func appGroupContainerURL() -> URL? {
        // 1
        let fileManager = FileManager.default
        guard let groupURL = fileManager
            .containerURL(forSecurityApplicationGroupIdentifier: appGroupIdentifier) else {
                return nil
        }
        
        let storagePathUrl = groupURL.appendingPathComponent(directoryName)
        let storagePath = storagePathUrl.path
        // 2
        if !fileManager.fileExists(atPath: storagePath) {
            do {
                try fileManager.createDirectory(atPath: storagePath,
                                                withIntermediateDirectories: false,
                                                attributes: nil)
            } catch let error {
                print("error creating filepath: \(error)")
                return nil
            }
        }
        // 3
        return storagePathUrl
    }
    
}

```
