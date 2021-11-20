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
        
        
        if (collectionView == self.randomLettersCollectionView){
            let cell = randomLettersCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIds.lettersCollectionViewCell, for: indexPath) as! LettersCollectionViewCell
            var char = self.logosArray?[indexPath.row].name
            cell.letterLabel.text = char
            cell.layer.cornerRadius = 8.0
            return cell
        }else if (collectionView == self.wordGuessCollectionView){
            let cell = wordGuessCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIds.lettersCollectionViewCell, for: indexPath) as! LettersCollectionViewCell
            cell.letterLabel.text = "To-Do:- on click of randomCollectionview letters it should be populate here"
            cell.layer.cornerRadius = 8.0
            return cell
        }
        return LettersCollectionViewCell()
    }
}
