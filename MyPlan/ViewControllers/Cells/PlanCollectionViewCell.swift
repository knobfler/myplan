//
//  PlanCollectionViewCell.swift
//  MyPlan
//
//  Created by 최동호 on 2018. 4. 6..
//  Copyright © 2018년 최동호. All rights reserved.
//

import UIKit

class PlanCollectionViewCell: UICollectionViewCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        return label
    }()
    
    let hrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: UIControlState.normal)
//        button.backgroundColor = UIColor.lightGray
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlanCollectionViewCell {
    func setupViews() {
        let margins = contentView.layoutMargins
        contentView.addSubview(dateLabel)
        contentView.addSubview(hrView)
        contentView.addSubview(addButton)
        
        dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: margins.left).isActive = true
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margins.top).isActive = true
        
        hrView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: margins.left).isActive = true
        hrView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: margins.right).isActive = true
        hrView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8).isActive = true
        hrView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        addButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -margins.right).isActive = true
        addButton.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor, constant: 0).isActive = true
        
    }
}
