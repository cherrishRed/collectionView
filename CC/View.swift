//
//  View.swift
//  CC
//
//  Created by 박세리 on 2022/05/11.
//

import UIKit

class View: UIView {
    // 세그먼트 생성
    let segment: UISegmentedControl = {
        let control = UISegmentedControl(items: ["firstView", "secondView"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
      }()
    //콜렉션 뷰 생성
    lazy var firstCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: firstLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // 첫번쨰 스타일 레이아웃 지정
    lazy var firstLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 10.0, right: 10.0)
        let availableWidth = self.layer.bounds.width
        layout.itemSize = CGSize(width: (availableWidth / 3) - 20 , height: 100)
        return layout
    }()
    // 두번째 스타일 레이아웃 지정
    lazy var secoundLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 10.0, right: 10.0)
        
        let availableWidth = self.layer.bounds.width
        layout.itemSize = CGSize(width: availableWidth - 20, height: 100)
        return layout
    }()
    // init 이 있어야 한다. 어디든...
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 세그먼트와 뷰 추가 오토레아아웃 설정
    func addElements() {
        backgroundColor = .white
        addSubview(segment)
        NSLayoutConstraint.activate([
              self.segment.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
              self.segment.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
              self.segment.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
              self.segment.heightAnchor.constraint(equalToConstant: 70),
            ])
        addSubview(firstCollectionView)
        NSLayoutConstraint.activate([
            self.firstCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.firstCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.firstCollectionView.topAnchor.constraint(equalTo: segment.bottomAnchor),
            self.firstCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        segment.addTarget(self, action: #selector(switchSegment(segmentControll:)), for: .valueChanged)
        
    }
    
    @objc func switchSegment(segmentControll: UISegmentedControl) {
        switch segmentControll.selectedSegmentIndex {
        case 0:
            firstCollectionView.collectionViewLayout = firstLayout
            print("haha")
        case 1:
            firstCollectionView.collectionViewLayout = secoundLayout
            print("leelee")
        default:
            print("없음")
        }
    }
}
