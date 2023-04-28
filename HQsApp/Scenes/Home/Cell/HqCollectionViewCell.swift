//
//  HqCollectionViewCell.swift
//  HQsApp
//
//  Created by Caio Cardozo on 27/04/23.
//

import UIKit
import SnapKit

final class HqCollectionViewCell: UICollectionViewCell {

    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        mainView.addSubview(titleLabel)
        contentView.addSubview(mainView)
    }
    private func addConstraints() {
        self.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setup(hq: HqModel) {
        
    }
}
