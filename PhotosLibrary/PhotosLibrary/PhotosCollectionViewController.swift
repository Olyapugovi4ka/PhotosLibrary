//
//  PhotosCollectionViewController.swift
//  PhotosLibrary
//
//  Created by Olga Melnik on 17.12.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController{
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        collectionView.backgroundColor = .green
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        
    }

    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = #colorLiteral(red: 0.5742413402, green: 0.5705442429, blue: 0.5704583526, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
    
        cell.backgroundColor = .red
        
    
        return cell
    }
    
}
