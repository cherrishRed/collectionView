//
//  CollectionViewCell.swift
//  CC
//
//  Created by 박세리 on 2022/05/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "셀"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func cellSetting() {
        backgroundColor = .systemIndigo
        addSubview(cellLabel)
        
        cellLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cellLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellLabel.textAlignment = .center
    }
}
