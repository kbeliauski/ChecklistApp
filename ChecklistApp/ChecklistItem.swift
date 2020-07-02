//
//  ChecklistItem.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 6/10/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable, Codable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
