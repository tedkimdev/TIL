//
//  ViewController.swift
//  instagram-clone
//
//  Created by aney on 2017. 3. 21..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBAction func buttonPressed(_ sender: Any) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.allowsEditing = false
    self.present(imagePickerController, animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}


extension ViewController: UIImagePickerControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
      self.imageView.image = image
      self.dismiss(animated: true, completion: nil)
    }
  }
  
}

extension ViewController: UINavigationControllerDelegate {
  
}
