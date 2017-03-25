//
//  MemoCell.swift
//  MemoApp-storyboard
//
//  Created by aney on 2017. 3. 25..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class MemoCell: UICollectionViewCell {
  
  // MARK: UI
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textLabel: UILabel!
  
  func configure(image: UIImage, title: String?) {
    self.imageView.image = image
    self.textLabel.text = title
  }
  
}
