//
//  SearchResults.swift
//  PhotosLibrary
//
//  Created by Olga Melnik on 18.12.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto:Decodable {
    let width: Int
    let height: Int
    let urls:[URLKind.RawValue:String]
    
    
}
enum URLKind: String {
    case raw
    case full
    case regular
    case small
    case thumb
}
