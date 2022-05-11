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
        let control = UISegmentedControl(items: ["그리드레이아웃", "라인레이아웃", "그리드컴포지션", "라인컴포지션", "사진컴포지션"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
      }()
    //콜렉션 뷰 생성
    lazy var firstCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: gridLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: 플로우 레이아웃
    // 첫번쨰 스타일 레이아웃 지정
    lazy var gridLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 10.0, right: 10.0)
        let availableWidth = self.layer.bounds.width
        layout.itemSize = CGSize(width: (availableWidth / 3) - 20 , height: 100)
        return layout
    }()
    // 두번째 스타일 레이아웃 지정
    lazy var lineLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 10.0, right: 10.0)
        
        let availableWidth = self.layer.bounds.width
        layout.itemSize = CGSize(width: availableWidth - 20, height: 100)
        return layout
    }()
    
    // MARK: 컴포지션 레이아웃
    // 첫번째 스타일 레이아웃 컴포지션으로 생성하기
    lazy var gridLayoutComposition: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                                 heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
          
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(44))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
          
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    // 두번째 스타일 레이아웃 컴포지션으로 생성하기
    lazy var lineLayoutComposition: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
          
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(44))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                             subitems: [item])
          
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    // 사진 스타일 레이아웃 컴포지션으로 생성하기
    lazy var pictureLayoutComposition: UICollectionViewCompositionalLayout = {
        // 왼쪽 큰셀 설정
        let mainItem = NSCollectionLayoutItem(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalHeight(1.0)))
        
        mainItem.contentInsets = NSDirectionalEdgeInsets(
          top: 2,
          leading: 2,
          bottom: 2,
          trailing: 2)
        // 작은 오른쪽 셀 설정
        let pairItem = NSCollectionLayoutItem(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)))
        
        pairItem.contentInsets = NSDirectionalEdgeInsets(
          top: 2,
          leading: 2,
          bottom: 2,
          trailing: 2)
        // 작은 오른쪽 셀그룹 만들어서 2개 반복
        let trailingGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1.0)),
          subitem: pairItem,
          count: 2)
        // 큰셀 작은셀 합치기
        let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(4/9)),
          subitems: [mainItem, trailingGroup])
          
        let section = NSCollectionLayoutSection(group: mainWithPairGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let layout = UICollectionViewCompositionalLayout(section: section)
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
            firstCollectionView.collectionViewLayout = gridLayout
        case 1:
            firstCollectionView.collectionViewLayout = lineLayout
        case 2:
            firstCollectionView.collectionViewLayout = gridLayoutComposition
        case 3:
            firstCollectionView.collectionViewLayout = lineLayoutComposition
        case 4:
            firstCollectionView.collectionViewLayout = pictureLayoutComposition
        default:
            print("없음")
        }
    }
}
