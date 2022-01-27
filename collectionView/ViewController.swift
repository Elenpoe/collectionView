//
//  ViewController.swift
//  collectionView
//
//  Created by Helen Poe on 23.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var images = [UIImage]()
    let countCells:CGFloat = 2
    let offset:CGFloat = 2.0
    let cellId = "cell"
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        
        for i in 1...6{
            let image = UIImage(named: "photo\(i)")!
            images.append(image)
        }
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImage", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.item]
        cell.photoView.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        let widthCell = frameCV.width / countCells
        let heightCell = widthCell
        let specing = (countCells + 1) * offset / countCells
        return CGSize(width: widthCell - specing, height: heightCell - offset * 2)
    }
}
