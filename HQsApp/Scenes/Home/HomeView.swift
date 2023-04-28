//
//  HomeView.swift
//  HQsApp
//
//  Created by Caio Cardozo on 26/04/23.
//

import UIKit
import SnapKit

final class HomeView: BaseView {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Pesquisar"
        searchBar.backgroundImage = UIImage()
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        viewLayout.minimumLineSpacing = 0
        viewLayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HqCollectionViewCell.self, forCellWithReuseIdentifier: HqCollectionViewCell.reuseIdentifier)
        collectionView.register(HqEmptyCollectionViewCell.self, forCellWithReuseIdentifier: HqEmptyCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(searchBar)
        self.addSubview(collectionView)
    }
    
    override func addConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
