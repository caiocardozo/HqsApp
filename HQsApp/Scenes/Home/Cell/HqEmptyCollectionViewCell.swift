//
//  HqEmptyCollectionViewCell.swift
//  HQsApp
//
//  Created by Caio Cardozo on 27/04/23.
//

import UIKit
import SnapKit

final class HqEmptyCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nenhum HQ encontrado"
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
        contentView.addSubview(titleLabel)
    }
    private func addConstraints() {
        self.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
