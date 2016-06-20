//
//  DataItemCell.swift
//  CollectionViewDemo
//
//  Created by PJ Basa on 19/06/2016.
//  Copyright © 2016 PJ Basa. All rights reserved.
//

import UIKit

class DataItemCell: UICollectionViewCell {
    @IBOutlet private weak var dataItemImageView: UIImageView!
    
    var dataItem: DataItem? {
        didSet {
            if let dataItem = dataItem {
                dataItemImageView.image = UIImage(named: dataItem.imageName)
            }
        }
    }
    
}
