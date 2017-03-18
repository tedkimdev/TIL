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
  @IBOutlet weak var titleEditTextField: UITextField!
  @IBOutlet weak var contentEditTextView: UITextView!
  @IBOutlet weak var editButton: UIButton!
  
  var article: Article?
  var isEdit: Bool = false

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.isEdit = false
    self.titleEditTextField.isHidden = true
    self.contentEditTextView.isHidden = true
    self.titleEditTextField.text = self.article?.title
    self.contentEditTextView.text = self.article?.content
    
    titleLabel.text = self.article?.title
    contentLabel.text = self.article?.content
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
  @IBAction func deleteButtonPressed(_ sender: Any) {
    if let article = self.article {
      context.delete(article)
    }
    appDelegate.saveContext()
    _ = navigationController?.popViewController(animated: true)
  }

  @IBAction func editButtonPressed(_ sender: Any) {
    if isEdit { // 수정 완료
      if let article = self.article {
        self.update(updatedArticle: article)
      }
      self.isEdit = !self.isEdit
      _ = navigationController?.popViewController(animated: true)
    } else {  // 수정 시작
      self.titleLabel.isHidden = true
      self.contentLabel.isHidden = true
      self.titleEditTextField.isHidden = false
      self.titleEditTextField.becomeFirstResponder()
      self.contentEditTextView.isHidden = false
      self.editButton.setTitle("수정 완료!!", for: .normal)
      self.isEdit = !self.isEdit
    }
  }
  
  // Updates an article
  func update(updatedArticle: Article){
    // TODO: update 로직 분리
    let article = context.object(with: updatedArticle.objectID) // NSManagedObject
    article.setValue(self.titleEditTextField.text, forKey: "title")
    article.setValue(self.contentEditTextView.text, forKey: "content")
    appDelegate.saveContext()
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
