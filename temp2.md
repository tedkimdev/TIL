```
<dict>
		<key>NSExtensionAttributes</key>
		<dict>
			<key>NSExtensionActivationRule</key>
			<dict>
				<key>NSExtensionActivationSupportsImageWithMaxCount</key>
				<integer>1</integer>
			</dict>
		</dict>
		<key>NSExtensionMainStoryboard</key>
		<string>MainInterface</string>
		<key>NSExtensionPointIdentifier</key>
		<string>com.apple.ui-services</string>
	</dict>
```
```swift
import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {

    let sharedKey = "ImageSharePhotoKey"
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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

    @IBAction func done() {
        guard let title = titleTextField.text,
            !title.isEmpty else { return }
        
        manageImages()
    }

    
    
    func manageImages() {
        
        let content = extensionContext!.inputItems[0] as! NSExtensionItem
        let contentType = kUTTypeImage as String
        
        for (index, attachment) in (content.attachments as! [NSItemProvider]).enumerated() {
            if attachment.hasItemConformingToTypeIdentifier(contentType) {
                
                attachment.loadItem(forTypeIdentifier: contentType, options: nil) { [weak self] data, error in
                    
                    if error == nil, let url = data as? URL, let this = self {
                        do {
                            
                            // GETTING RAW DATA
                            let rawData = try Data(contentsOf: url)
                            let rawImage = UIImage(data: rawData)
                            let imgData = rawImage?.pngData()
                            
                            if index == (content.attachments?.count)! - 1 {
                                DispatchQueue.main.async {
                                    
                                    let userDefaults = UserDefaults(suiteName: "group.com.mirareality.example.dfdfdf")
                                    userDefaults?.set(imgData, forKey: this.sharedKey)
                                    userDefaults?.synchronize()
                                }
                            }
                            self?.extensionContext!.completeRequest(returningItems: self?.extensionContext!.inputItems, completionHandler: nil)
                        }
                        catch let exp {
                            print("GETTING EXCEPTION \(exp.localizedDescription)")
                        }
                    } else {
                        print("GETTING ERROR")
                        let alert = UIAlertController(title: "Error", message: "Error loading image", preferredStyle: .alert)
                        
                        let action = UIAlertAction(title: "Error", style: .cancel) { _ in
                            self?.dismiss(animated: true, completion: nil)
                        }
                        
                        alert.addAction(action)
                        self?.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
}

```
