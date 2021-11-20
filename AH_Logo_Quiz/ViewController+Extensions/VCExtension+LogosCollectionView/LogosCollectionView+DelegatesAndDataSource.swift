//
//  ViewController+LogosCollectionView.swift
//  AH_Logo_Quiz
//
//  Created by Abhijit Hadkar on 20/11/21.
//

import Foundation
import UIKit

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        
    func setupCollectionViewDelegateDataSource() {
        self.logosCollectionView.delegate = self
        self.logosCollectionView.dataSource = self
        self.wordGuessCollectionView.delegate = self
        self.wordGuessCollectionView.dataSource = self
        self.randomLettersCollectionView.delegate = self
        self.randomLettersCollectionView.dataSource = self
        
        self.logosCollectionView.register(UINib(nibName: CollectionViewCellIds.logosCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIds.logosCollectionViewCell)
        self.wordGuessCollectionView.register(UINib(nibName: CollectionViewCellIds.lettersCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIds.lettersCollectionViewCell)
        self.randomLettersCollectionView.register(UINib(nibName: CollectionViewCellIds.lettersCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIds.lettersCollectionViewCell)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.logosCollectionView){
            return self.logosArray?.count ?? 0
        }else if (collectionView == self.randomLettersCollectionView){
            return 5
        }else if (collectionView == self.wordGuessCollectionView){
            return 5
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.logosCollectionView){
            return self.showLogoCollectionViewCell(indexPath: indexPath)
        }else if (collectionView == self.randomLettersCollectionView){
            return self.showLetterCollectionViewCell(collectionView: collectionView, indexPath: indexPath)
        }else if (collectionView == self.wordGuessCollectionView){
            return self.showLetterCollectionViewCell(collectionView: collectionView, indexPath: indexPath)
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view
            .frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: self.logosCollectionView.frame.height/2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == self.randomLettersCollectionView){
            
        }
    }
}
