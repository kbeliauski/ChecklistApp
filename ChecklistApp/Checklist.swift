//
//  Checklist.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 6/10/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import Foundation

class Checklist: ObservableObject {
    
    @Published var item = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    
    func printChecklistContents() {
        for item in item {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        item.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        item.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
}
