//
//  CollapsibleTableViewCell.swift
//  tempProject
//
//  Created by Aleksey on 24/10/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import Foundation
import UIKit

class CollapsibleTableViewCell: UITableViewCell {
    let separator = UIView(frame: .zero)
    
    let iconImageView: UIImageView? = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        
        return iv
    }()
    
    func configure(withViewModel viewModel: CollapsableViewModel) {
        self.textLabel?.text = viewModel.label
        if let icon = iconImageView {
            addSubview(icon)
        }
        
        if(viewModel.needsSeparator) {
            separator.backgroundColor = .gray
            contentView.addSubview(separator)
        } else {
            separator.removeFromSuperview()
        }
        
        // iconImageView constaints
        iconImageView?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        iconImageView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView?.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let separatorHeight = 1 / UIScreen.main.scale
        separator.frame = CGRect(x: separatorInset.left,
                                 y: contentView.bounds.height - separatorHeight,
                                 width: contentView.bounds.width-separatorInset.left-separatorInset.right,
                                 height: separatorHeight)
    }
}
