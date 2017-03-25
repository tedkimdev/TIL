//
//  FilterViewController.swift
//  instagram-clone
//
//  Created by aney on 2017. 3. 25..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

final class FilterViewController: UIViewController {

  // MARK: UI
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var collectionView: UICollectionView!
  
  
  // MARK: Properties
  
  var image: UIImage?
  var filterIndex = 0
  let context = CIContext(options: nil)
  let filterNameList = [
    "No Filter",
    "CIPhotoEffectChrome",
    "CIPhotoEffectFade",
    "CIPhotoEffectInstant",
    "CIPhotoEffectMono",
    "CIPhotoEffectNoir",
    "CIPhotoEffectProcess",
    "CIPhotoEffectTonal",
    "CIPhotoEffectTransfer",
    "CILinearToSRGBToneCurve",
    "CISRGBToneCurveToLinear"
  ]
  let filterDisplayNameList = [
    "Normal",
    "Chrome",
    "Fade",
    "Instant",
    "Mono",
    "Noir",
    "Process",
    "Tonal",
    "Transfer",
    "Tone",
    "Linear"
  ]

  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.imageView.image = self.image!
    
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
  }
  
  
  // MARK: Image Functions
  
  func createFilteredImage(filterName: String, image: UIImage) -> UIImage {
    // 1 - create source image
    let sourceImage = CIImage(image: image)
    
    // 2 - create filter using name
    let filter = CIFilter(name: filterName)
    filter?.setDefaults()
    
    // 3 - set source image
    filter?.setValue(sourceImage, forKey: kCIInputImageKey)
    
    // 4 - output filtered image as cgImage with dimension.
    let outputCGImage = context.createCGImage((filter?.outputImage!)!, from: (filter?.outputImage!.extent)!)
    
    // 5 - convert filtered CGImage to UIImage
    let filteredImage = UIImage(cgImage: outputCGImage!)
    
    return filteredImage
  }
  
}


// MARK: - UICollectionViewDataSource

extension FilterViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filterDisplayNameList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! FilterCell
    
    var filteredImage = self.image
    if indexPath.item != 0 {
      filteredImage = createFilteredImage(filterName: filterNameList[indexPath.item], image: filteredImage!)
    }
    
    cell.filterImage.image = filteredImage
    cell.filterLabel.text = "\(filterDisplayNameList[indexPath.item])"
    
    return cell
  }
  
}


// MARK: - UICollectionViewDelegate

extension FilterViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    filterIndex = indexPath.item
    
    if filterIndex != 0 {
      self.imageView.image = createFilteredImage(filterName: filterNameList[indexPath.item], image: self.image!)
    } else {
      self.imageView.image = self.image
    }
    
  }
  
}
