//
//  ViewController.swift
//  CC
//
//  Created by 박세리 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {
    lazy var myView = View.init(frame: view.bounds)
    var data = MockData.data

    override func viewDidLoad() {
        super.viewDidLoad()
        myView.firstCollectionView.delegate = self
        myView.firstCollectionView.dataSource = self
        // 셀의 아이덴티 파이어를 등록
        myView.firstCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CC")
        self.view = myView
    }
}
//MARK: delegate
extension ViewController: UICollectionViewDelegate {

}
//MARK: DataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myView.firstCollectionView.dequeueReusableCell(withReuseIdentifier: "CC", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.cellLabel.text = String(data[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

}


