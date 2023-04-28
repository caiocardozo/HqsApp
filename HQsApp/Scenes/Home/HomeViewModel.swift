//
//  HomeViewModel.swift
//  HQsApp
//
//  Created by Caio Cardozo on 26/04/23.
//

import Foundation

final class HomeViewModel: BaseViewModel {
    
    var reloadCollectionView: (() -> Void)?
    var hqs: [HqModel] = []
    var hqsFilter: [HqModel] = []
    
    // MARK: - Search Itens
    func bindSearchToModel(text: String) {
        switch text.isEmpty {
        case false:
            let list = self.hqs.filter {
                $0.title?.range(of: text, options: .caseInsensitive) != nil
            }
            self.hqsFilter = list
            self.reloadCollectionView?()
        case true:
            self.hqsFilter = self.hqs
            self.reloadCollectionView?()
        }
    }
    
    func loadData() {
        // TODO: Call request
    }
}
