//
//  MemoDetailViewController.swift
//  MemoApp-storyboard
//
//  Created by aney on 2017. 3. 26..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController {

  // MARK: Properties
  
  var memo: Memo?
  
  
  // MARK: UI
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textView: UITextView!
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Memo Detail"
    self.navigationController?.navigationBar.tintColor = .white
    self.imageView.image = self.memo?.image
    self.textView.text = self.memo?.title
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
