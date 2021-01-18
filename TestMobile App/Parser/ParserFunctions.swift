//
//  ParserFunctions.swift
//  TestMobile App
//
//  Created by David Lopez Salinas on 1/15/21.
//

import Foundation
import SwiftSoup

// Hold info about validation errors
class ParserFunctions {
    static let shared = ParserFunctions()
   
    func getAllcomic(html: String) -> Comic? {
       
        do {
            
            let titleParse : Elements = try SwiftSoup.parse(html).select("div[id=ctitle]")
            let title = try titleParse.html()
            
            let urlImage : Elements = try SwiftSoup.parse(html).select("div[id=comic]")
            let url = try urlImage[0].child(0).attr("src")
            
            let comic = Comic(urlImage: url, titleComic: title)
            return comic
            
        } catch {
            return nil
        }
    }
}

