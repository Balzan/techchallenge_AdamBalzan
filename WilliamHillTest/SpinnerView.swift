//
//  SpinnerView.swift
//  WilliamHillTest
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//

import UIKit

class SpinnerView: UIView {

    func showSpinner() {
        if (spinnerView.superview != nil){
            return
        }
        DispatchQueue.main.async {
            self.spinner.startAnimating()
            self.tableView.superview?.addSubview(self.spinnerView)
            // fall back cancel spinner after 10 seconds
            self.perform(#selector(self.hideSpinner), with: nil, afterDelay: 10)
        }
    }
    
    func hideSpinner() {
        if (spinnerView.superview != nil){
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.spinnerView.removeFromSuperview()
            }
        }
    }
    
    func setupSpinner(inView:UIView){
        self.spinnerView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        self.spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        self.spinnerView.center = self.tableView.center;
        self.spinnerView.layer.masksToBounds = true
        self.spinnerView.layer.cornerRadius = 5
        
        self.spinnerView.addSubview(self.spinner)
        self.spinner.center = CGPoint(x:self.spinnerView.frame.size.width / 2, y:self.spinnerView.frame.size.height / 2)
        self.spinner.hidesWhenStopped = true
        
    }

}
