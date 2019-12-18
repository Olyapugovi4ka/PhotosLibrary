//
//  PhotosCollectionViewController.swift
//  PhotosLibrary
//
//  Created by Olga Melnik on 17.12.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController{
    
    var networkDataFetcher = NetworkDataFetcher()
    
    private var timer : Timer?
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem (barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
    }()
    override func viewDidLoad() {
        super .viewDidLoad()
        
        collectionView.backgroundColor = .green
        setupNavigationBar()
        setupCollectionView()
        setupSearchBar()
    }
    //MARK: - -navigation items action
    @objc private func addBarButtonTapped() {
        print(#function)
    }
    
    @objc private func actionBarButtonTapped() {
        print(#function)
    }
    //MARK: - setup UI elements
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        
    }

    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = #colorLiteral(red: 0.5742413402, green: 0.5705442429, blue: 0.5704583526, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButtonItem]
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    //MARK: - UICollectionViewDataSourse, UICollectionViewDelegte
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
    
        cell.backgroundColor = .red
        
    
        return cell
    }
    
}
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 50.0, height: 50.0)
        return size
    }
}
//MARK: - UISearchBarDelegate
extension PhotosCollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkDataFetcher.fetchImages(searchTerm: searchText) { (searchResults) in
                searchResults?.results.map({ (photo) in
                    print(photo.urls["small"])
                })
            }
        })
        
    }
}
