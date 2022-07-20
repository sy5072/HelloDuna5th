//
//  ThridViewController.swift
//  HelloDuna5th
//
//  Created by Seungyun Kim on 2022/07/20.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var keywordCollectionView: UICollectionView!
    @IBOutlet weak var warningLabel: UILabel!
    var nameList: [String] = []
    var selectedNameList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataList()
        configCollectionView()
    }

    func configCollectionView() {
        //xib 은 register  가 필요
        let nibName = UINib(nibName: KeywordCollectionViewCell.identifier, bundle: nil)
        keywordCollectionView.register(nibName, forCellWithReuseIdentifier: KeywordCollectionViewCell.identifier)
        keywordCollectionView.dataSource = self
    }
    
    func initDataList() {
        nameList.append(contentsOf: [
            "한스", "스누피", "비트", "닉7", "닉8", "데이크", "밀러", "듀나", "스킵", "머피", "윌", "요셉", "우기", "티모"
        ])
    }
}

extension ThirdViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCollectionViewCell.identifier, for: indexPath) as? KeywordCollectionViewCell else { return UICollectionViewCell() }
        cell.setKeyword(text: nameList[indexPath.row])
        cell.keywordDelegate = self
        cell.presentingClosure = { [weak self] keyword in
            guard let nextVC = self?.storyboard?.instantiateViewController(withIdentifier: SecondViewController.identifier) as? SecondViewController else { return }
            nextVC.receivedText = keyword
            self?.present(nextVC, animated:true, completion: nil)
        }
        return cell
    }
}

extension ThirdViewController: KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCollectionViewCell) {
        selectedNameList.append(cell.keyword)
        updateWarningLabel()
    }
    
    func keywordCellUnselected(Cell: KeywordCollectionViewCell, unselectedName: String) {
        let deletingIndex = selectedNameList.firstIndex(of: unselectedName) ?? -1
        selectedNameList.remove(at: deletingIndex)
        updateWarningLabel()
    }
    
    func updateWarningLabel() {
        warningLabel.text = "\(selectedNameList.count)명이 선택 되었습니다."
        warningLabel.textColor = selectedNameList.count > 8 ? .red : .black
    }
}
