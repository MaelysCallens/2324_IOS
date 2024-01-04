//
//  Notification.swift
//  Wishlist
//
//  Created by Maëlys Callens on 04/01/2024.
//

import Foundation

struct Notification: Identifiable {
    let id = UUID()
    let message: String
    let displayTime: Double = 2.0
}
