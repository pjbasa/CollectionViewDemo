//
//  DataItemHeader.swift
//  CollectionViewDemo
//
//  Created by PJ Basa on 19/06/2016.
//  Copyright © 2016 PJ Basa. All rights reserved.
//

import UIKit

class DataItemHeader: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
