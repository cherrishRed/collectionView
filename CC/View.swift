//
//  View.swift
//  CC
//
//  Created by 박세리 on 2022/05/11.
//

import UIKit

class View: UIView {
    let segment: UISegmentedControl = {
        let control = UISegmentedControl(items: ["firstView", "secondView"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
      }()
    
    let firstCollectionView: UICollectionView = {
        //레이아웃 지정
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 7.0, bottom: 5.0, right: 7.0)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let ll = UICollectionViewLayout()
        
        //콜렉션 뷰 생성
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            print("haha")
        case 1:
            print("leelee")
        default:
            print("없음")
        }
    }
}
