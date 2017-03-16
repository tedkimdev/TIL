//
//  DetailViewController.swift
//  diary
//
//  Created by aney on 2017. 3. 17..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  
  var titleText: String?
  var contentText: String?

    override func viewDidLoad() {
      super.viewDidLoad()
      
      titleLabel.text = self.titleText
      contentLabel.text = self.contentText
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
    }
    */

}
