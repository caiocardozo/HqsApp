//
//  BaeViewModel.swift
//  HQsApp
//
//  Created by Caio Cardozo on 26/04/23.
//

import Foundation

class BaseViewModel {
    var error: ((String) -> Void)?
    var isLoading: ((Bool) -> Void)?
}
