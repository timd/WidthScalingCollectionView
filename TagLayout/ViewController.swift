//
//  ViewController.swift
//  TagLayout
//
//  Created by Tim Duckett on 12.05.20.
//  Copyright © 2020 Tim Duckett. All rights reserved.
//

import UIKit

enum Section {
    case main
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cvData = Array<String>()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, String>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        
        configureLayout()
        
        configureCollectionView()

    }
    
    func setupData() {
        
        cvData.append("aaa")
        cvData.append("bb")
        cvData.append("ccccccc")
        cvData.append("ddddd")
        cvData.append("eeeeeeeeee")
        cvData.append("fff")
        cvData.append("ggggggggg")
        cvData.append("hhh")
        cvData.append("iiiiiiiiiiiiiii")
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cvData)
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
    }
    
    func configureCollectionView() {
        
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: "TagCellIdentifier")
        
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, identifier: String) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCellIdentifier", for: indexPath) as! TagCell
            
            cell.titleLabel.text = self.cvData[indexPath.row]
            
            cell.backgroundColor = UIColor.yellow
            
            return cell
            
        })
        
    }
    
    func configureLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
    }
        
}

