//
//  UICollectionViewCell+Extension.swift
//  HQsApp
//
//  Created by Caio Cardozo on 27/04/23.
//

import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
