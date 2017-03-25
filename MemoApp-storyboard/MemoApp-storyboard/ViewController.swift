//
//  ViewController.swift
//  MemoApp-storyboard
//
//  Created by aney on 2017. 3. 25..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: Propertes
  
  var memos: [Memo] = [
    Memo(title: "Sydney", image: UIImage(named: "01.jpg")!),
    Memo(title: "Rose", image: UIImage(named: "02.jpg")!),
    Memo(title: "leaf", image: UIImage(named: "03.jpg")!),
    Memo(title: "stair", image: UIImage(named: "04.jpg")!),
    Memo(title: "wall", image: UIImage(named: "05.jpg")!),
    Memo(title: "sea", image: UIImage(named: "06.jpg")!),
    Memo(title: "bug", image: UIImage(named: "07.jpg")!),
    Memo(title: "wood", image: UIImage(named: "08.jpg")!),
    Memo(title: "house", image: UIImage(named: "09.jpg")!),
    Memo(title: "butterfly", image: UIImage(named: "10.jpg")!),
  ]
  

  // MARK: UI
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  // MARK: Segue
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "detailSegue" {
      let memoDetailViewController = segue.destination as! MemoDetailViewController
      if let indexPaths = self.collectionView.indexPathsForSelectedItems {
        let indexPath = indexPaths[0]
        memoDetailViewController.memo = self.memos[indexPath.item]
      }
    }
  }
  
}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return memos.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let memo = self.memos[indexPath.item]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memoCell", for: indexPath) as! MemoCell
    cell.configure(image: memo.image, title: memo.title)
    return cell
  }

}


// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("cell selected")
  }
  
}
