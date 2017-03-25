//
//  ViewController.swift
//  instagram-clone
//
//  Created by aney on 2017. 3. 21..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: UI
  
  @IBOutlet weak var imageView: UIImageView!
  @IBAction func buttonPressed(_ sender: Any) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.allowsEditing = true
    self.present(imagePickerController, animated: true, completion: nil)
  }
  
  
  // MARK: Properties
  
  var image: UIImage?
  
//  @IBAction func filterButtonPressed(_ sender: Any) {
//    let sharakuController = SHViewController(image: self.imageView.image!)
//    sharakuController.delegate = self
//    self.present(sharakuController, animated: true, completion: nil)
//  }
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: Segue
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "filterSegue" {
      let filterViewController = segue.destination as! FilterViewController
      filterViewController.image = image
    }
  }

}


// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let image = info[UIImagePickerControllerEditedImage] as? UIImage { //UIImagePickerControllerOriginalImage
      self.imageView.image = image
      self.image = image
      self.dismiss(animated: true, completion: nil)
    }
  }
  
}


// MARK: - UINavigationControllerDelegate

extension ViewController: UINavigationControllerDelegate {
  
}


// MARK: - SHViewControllerDelegate

extension ViewController: SHViewControllerDelegate {
 
  func shViewControllerImageDidFilter(image: UIImage) {
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
  }
  
  func shViewControllerDidCancel() {
    //
  }
  
}
