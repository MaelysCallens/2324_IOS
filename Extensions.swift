//
//  Extensions.swift
//  Wishlist
//
//  Created by Maëlys Callens on 03/01/2024.
//

import Foundation

extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
