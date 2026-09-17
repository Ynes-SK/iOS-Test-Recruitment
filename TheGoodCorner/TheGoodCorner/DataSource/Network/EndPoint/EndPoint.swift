//
//  EndPoint.swift
//  TheGoodCorner
//
//  Created by Ines SK on 17.09.26.
//

import Foundation

protocol EndPoint{
    var baseURL: URL { get }
    var path: String { get }
    var method: String { get }
}
