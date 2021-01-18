//
//  Comic.swift
//  TestMobile App
//
//  Created by David Lopez Salinas on 1/15/21.
//

import Foundation

public struct Comic {
    // MARK: Properties
    public var urlImage: String
    public var titleComic: String
    
    public init(urlImage:String, titleComic:String) {
        self.urlImage = urlImage
        self.titleComic = titleComic
    }
}
