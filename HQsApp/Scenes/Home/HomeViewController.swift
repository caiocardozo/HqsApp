//
//  HomeViewController.swift
//  HQsApp
//
//  Created by Caio Cardozo on 26/04/23.
//

import UIKit

final class HomeViewController: UIViewController, HasCustomView {
    // MARK: - Typealias
    typealias CustomView = HomeView
    var viewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView()
        view = customView
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupObservables()
        viewModel.loadData()
    }
    
    private func setupObservables() {
        viewModel.isLoading = { [weak self] loading in
            self?.isLoading(loading: loading)
        }
        viewModel.error = { [weak self] error in
           // TODO: Messagem de erro
        }

        viewModel.reloadCollectionView = {
            self.customView.collectionView.reloadData()
        }
    }
    
    private func setupDelegate() {
        customView.searchBar.delegate = self
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
    }
}

//MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.bindSearchToModel(text: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        customView.searchBar.text = ""
        customView.collectionView.reloadData()
    }
}

extension HomeViewController:  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if viewModel.hqsFilter.isEmpty {
            return CGSize(width: self.customView.collectionView.frame.size.width, height: self.customView.collectionView.frame.size.height)
        } else {
            return CGSize(width: (self.customView.collectionView.frame.size.width - 16) / 2, height: 120)
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return section == 0 ? 0 : 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return section == 0 ? 0 : 16
    }

}
// MARK: - Extension UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // TODO: Define when itens is show
    }
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewModel.hqsFilter.isEmpty {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HqEmptyCollectionViewCell.reuseIdentifier, for: indexPath) as! HqEmptyCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HqCollectionViewCell.reuseIdentifier, for: indexPath) as! HqCollectionViewCell
            cell.setup(hq: viewModel.hqsFilter[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // TODO: Open item in display detail
    }
}
