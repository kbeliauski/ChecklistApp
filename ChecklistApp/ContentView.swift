//
//  ContentView.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 4/14/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import SwiftUI

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    @State var checklistItems = [
            ChecklistItem(name: "Walk the dog"),
            ChecklistItem(name: "Brush my teeth"),
            ChecklistItem(name: "Walk the dog", isChecked: true),
            ChecklistItem(name: "Soccer practice"),
            ChecklistItem(name: "Walk the dog", isChecked: true),
        ]
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        //ternary conditional operator
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.printChecklistContents()
            }
        }
    }
    
    func printChecklistContents() {
        for item in checklistItems {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
