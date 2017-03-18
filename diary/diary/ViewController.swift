//
//  ViewController.swift
//  diary
//
//  Created by aney on 2017. 3. 12..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var textInput: UITextField!
  @IBOutlet weak var textArea: UITextView!
  
  @IBAction func buttonPressed(_ sender: Any) {
    let text = textInput.text
    
    let content = textArea.text
    
    let article = Article(context: context)
    article.title = text
    article.content = content
    article.createdAt = NSDate()
    appDelegate.saveContext()
    
    _ = navigationController?.popViewController(animated: true)
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

