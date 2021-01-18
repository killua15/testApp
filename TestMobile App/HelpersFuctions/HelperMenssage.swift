//
//  HelperMenssage.swift
//  TestMobile App
//
//  Created by David Lopez Salinas on 1/16/21.
//
import Foundation
import SwiftSoup
import NotificationBannerSwift
// Hold info about validation errors
class HelperMenssage {
    static let shared = HelperMenssage()
    
    func messageError(title: String, subtitle: String) {
        let banner = NotificationBanner(title: title, subtitle: subtitle, style: .danger)
        banner.show()
    }
    
    func messageSuccsess(title: String, subtitle: String) {
        let banner = NotificationBanner(title: title, subtitle: subtitle, style: .success)
        banner.show()
    }
}

