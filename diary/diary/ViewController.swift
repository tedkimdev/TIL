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
  @IBOutlet weak var textLabel: UILabel!
  @IBOutlet weak var textArea: UITextView!
  @IBOutlet weak var contentLabel: UILabel!
  
  @IBAction func buttonPressed(_ sender: Any) {
    let text = textInput.text
    textLabel.text = text
    
    let content = textArea.text
    contentLabel.text = content
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

