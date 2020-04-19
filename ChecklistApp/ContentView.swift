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
    
    //properties
    //=========
    
    
    @State var checklistItems = [
            ChecklistItem(name: "Walk the dog"),
            ChecklistItem(name: "Brush my teeth"),
            ChecklistItem(name: "Learn iOS development", isChecked: true),
            ChecklistItem(name: "Soccer practice"),
            ChecklistItem(name: "Eat ice cream", isChecked: true),
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
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = self.checklistItems.firstIndex(where: {
                            $0.id == checklistItem.id
                        }) {
                            self.checklistItems[matchingIndex].isChecked.toggle()
                        }
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
    
    //methods
    //=======
    
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

//preview
//=======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
