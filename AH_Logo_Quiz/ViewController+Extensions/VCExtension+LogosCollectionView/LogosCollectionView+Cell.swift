//
//  LogosCollectionView+Cell.swift
//  AH_Logo_Quiz
//
//  Created by Abhijit Hadkar on 20/11/21.
//

import Foundation
import UIKit

extension ViewController{
    
    func showLogoCollectionViewCell(indexPath : IndexPath) -> LogosCollectionViewCell {
        
        let cell = logosCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIds.logosCollectionViewCell, for: indexPath) as! LogosCollectionViewCell
        
        if let imageUrl = self.logosArray?[indexPath.row].imgUrl{
            DispatchQueue.main.async {
                cell.logoImageView.downloaded(from: imageUrl)
            }
        }
        cell.layer.cornerRadius = 8.0
        
        return cell
    }
    
    func showLetterCollectionViewCell(collectionView: UICollectionView,indexPath : IndexPath) -> LettersCollectionViewCell {
        
        let cell = logosCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIds.lettersCollectionViewCell, for: indexPath) as! LettersCollectionViewCell
        if (collectionView == self.randomLettersCollectionView){
            var char = self.logosArray?[indexPath.row].name.randomElement()
            cell.letterLabel.text = String(char)
        }else if (collectionView == self.wordGuessCollectionView){
            cell.letterLabel.text = ""
        }
        cell.layer.cornerRadius = 8.0
        
        return cell
    }
}
