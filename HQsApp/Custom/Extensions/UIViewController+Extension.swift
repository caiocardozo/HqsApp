//
//  UIViewController+Extension.swift
//  HQsApp
//
//  Created by Caio Cardozo on 26/04/23.
//

import UIKit

private var loaderView: UIView?

extension UIViewController {
    private func showLoader() {
        
        if loaderView == nil {
            // creating loaderView
            loaderView = UIView(frame: UIScreen.main.bounds)
            
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let viewBlur = UIVisualEffectView(effect: blurEffect)
            
            viewBlur.layer.cornerRadius = 10
            viewBlur.clipsToBounds = true
            
            viewBlur.frame = CGRect(x: 0, y: 0, width: 120, height: 100)
            loaderView?.addSubview(viewBlur)
            viewBlur.center = loaderView!.center
            // stackview for loader and text
            let stackView = UIStackView(frame: viewBlur.frame)
            stackView.spacing = 16
            stackView.axis = .vertical
            
            // loader
            let loader = UIActivityIndicatorView(style: .large)
            loader.startAnimating()
            stackView.addArrangedSubview(loader)
            
            // add stackview as subview for centerView
            viewBlur.contentView.addSubview(stackView)
            
            // setup constraints
            stackView.translatesAutoresizingMaskIntoConstraints = false
            viewBlur.addConstraints([
                NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: viewBlur, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: viewBlur, attribute: .centerY, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: viewBlur, attribute: .leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: viewBlur, attribute: .trailing, multiplier: 1, constant: 0)
            ])
        }
        
        if self.navigationController ==  nil {
            self.view.addSubview(loaderView!)
        } else {
            self.navigationController?.view.addSubview(loaderView!)
        }
        
    }
    private func hideLoader () {
        if loaderView != nil {
            loaderView?.removeFromSuperview()
        }
    }
    func setLoader(loading isLoading: Bool) {
        isLoading ? self.showLoader() : self.hideLoader()
    }
    
    func push(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
