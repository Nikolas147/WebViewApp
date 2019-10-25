//
//  CollapsableViewModel.swift
//  tempProject
//
//  Created by Aleksey on 25/10/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import Foundation
import UIKit

class CollapsableViewModel {
    var label: String
    let link: String?
    let image: UIImage?
    let children: [CollapsableViewModel]
    var isCollapsed: Bool
    var needsSeparator: Bool = true

    init(label: String, link: String? = nil, image: UIImage? = nil, children: [CollapsableViewModel] = [], isCollapsed: Bool = true) {
        self.label = label
        self.link = link
        self.image = image
        self.children = children
        self.isCollapsed = isCollapsed

        for child in self.children {
            child.needsSeparator = false
        }
        self.children.last?.needsSeparator = true
    }
}
