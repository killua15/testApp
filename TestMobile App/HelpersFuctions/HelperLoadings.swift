//
//  Helper.swift
//  TestMobile App
//
//  Created by David Lopez Salinas on 1/16/21.
//

import Foundation
import SwiftSoup
import ProgressHUD
// Hold info about validation errors
class HelperLoadings {
    static let shared = HelperLoadings()
    
    func startLoading(parent: UIViewController) {
        ProgressHUD.show()
    }
    
    func stopLoading() {
        ProgressHUD.dismiss()
    }
}

