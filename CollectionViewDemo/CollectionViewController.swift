//
//  CollectionViewController.swift
//  CollectionViewDemo
//
//  Created by PJ Basa on 19/06/2016.
//  Copyright © 2016 PJ Basa. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell" - removed as per exercise 1.7

class CollectionViewController: UICollectionViewController {
    var plantDataItems = [DataItem]()
    var animalDataItems = [DataItem]()
    var allItems = [[DataItem]]()
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        let item = DataItem(title: "New Item", kind: .Animal, imageName: "images/default.jpeg")
        let index = allItems[0].count
        allItems[0].append(item)
        let indexPath = NSIndexPath(forItem: index, inSection: 0)
        collectionView?.insertItemsAtIndexPaths([indexPath])
    }
    
    override func viewDidLoad() {
        toolBar.hidden = true
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
       
            
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        for i in 1...12 {
            if i > 9 {
                plantDataItems.append(DataItem(title: "Title #\(i)", kind: Kind.Plant, imageName: "images/img\(i).jpg"))
            } else {
                plantDataItems.append(DataItem(title: "Title #0\(i)", kind: Kind.Plant, imageName: "images/img0\(i).jpg"))
            }
        }
        
        
        for i in 1...12 {
            if i > 9 {
                animalDataItems.append(DataItem(title: "Another Title #\(i)", kind: Kind.Animal, imageName: "images/anim\(i).jpg"))
            } else {
                animalDataItems.append(DataItem(title: "Another Title #0\(i)", kind: Kind.Animal, imageName: "images/anim0\(i).jpg"))
            }
        }
        
        allItems.append(plantDataItems)
        allItems.append(animalDataItems)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier) - removed as per exercise 1.7

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var toolBar: UIBarButtonItem!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "SectionHeader", forIndexPath: indexPath) as! DataItemHeader
        var title = ""
        if let kind = Kind(rawValue: indexPath.section) {
            title = kind.description()
        }
        sectionHeader.title = title
        
        return sectionHeader
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return allItems.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allItems[section].count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as!
        DataItemCell
        let dataItem = allItems[indexPath.section][indexPath.row]
        cell.dataItem = dataItem
    
        return cell
    }

    // MARK: Editing
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        collectionView?.allowsMultipleSelection = editing
        toolBar.hidden = !editing
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
