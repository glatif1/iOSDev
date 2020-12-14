//
//  photo.swift
//  MVCTableView
//
//  Created by Ghufran Latif  on 12/10/20.
//

import Foundation


struct photo: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
