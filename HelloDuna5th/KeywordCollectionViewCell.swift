//
//  KeywordCollectionViewCell.swift
//  HelloDuna5th
//
//  Created by Seungyun Kim on 2022/07/20.
//

import UIKit

protocol KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCollectionViewCell)
    func keywordCellUnselected(Cell: KeywordCollectionViewCell, unselectedName: String)
}

class KeywordCollectionViewCell: UICollectionViewCell {
    static let identifier = "KeywordCollectionViewCell"

    @IBOutlet weak var keywordButton: UIButton!
    var keyword: String = ""
    var isSelectedKeyword: Bool = false
    var keywordDelegate: KeywordCellDelegate?
    var presentingClosure: ((String) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func touchUpToSelect(_ sender: Any) {
        if isSelectedKeyword {
            keywordDelegate?.keywordCellUnselected(Cell: self, unselectedName: keyword)
            keywordButton.backgroundColor = .clear
        } else {
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .systemPink
            presentingClosure?(keyword)
        }
        isSelectedKeyword.toggle()
    }
    
    func setKeyword(text: String) {
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }
}
