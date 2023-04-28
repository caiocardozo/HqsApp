//
//  HomeView.swift
//  HQsApp
//
//  Created by Caio Cardozo on 26/04/23.
//

import UIKit
import SnapKit

final class HomeView: BaseView {
    
    lazy var testeLabel: UILabel = {
        let label = UILabel()
        label.text = "Home show"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(testeLabel)
    }
    
    override func addConstraints() {
        testeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
