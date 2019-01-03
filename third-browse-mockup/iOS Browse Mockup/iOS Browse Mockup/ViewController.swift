//
//  ViewController.swift
//  iOS Browse Mockup
//
//  Created by Nick Geary on 12/19/18.
//  Copyright © 2018 Quibi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let numRows = 100
    let numItemsInEachRow = 100
    var storedOffsets = [Int: CGFloat]()
    var myBrowseableItems = [BrowseableItem]()
    
    func populateItems() {
        myBrowseableItems.append(BrowseableItem(img: "united-shades-of-america", title: "United Shades of America", genres: "Documentary"))
        myBrowseableItems.append(BrowseableItem(img: "rick-and-morty", title: "Rick and Morty", genres: "Comedy, Animation"))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        populateItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tvCell = tableView.dequeueReusableCell(withIdentifier: "tvCell", for: indexPath) as! TableViewCell
        tvCell.rowLabel.text = "Category " + String(indexPath.row + 1)
        
        return tvCell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numItemsInEachRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cvCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as! CollectionViewCell
        
        let randNum = Int.random(in: 0..<myBrowseableItems.count)
        cvCell.titleLabel.text = myBrowseableItems[randNum].title
        cvCell.genresLabel.text = myBrowseableItems[randNum].genres
        cvCell.imgView.image = UIImage(named: myBrowseableItems[randNum].img!)
        
        return cvCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")

    }
}
