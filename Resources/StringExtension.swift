//
//  StringExtension.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 18/10/2022.
//

import Foundation
extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
