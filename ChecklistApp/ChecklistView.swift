//
//  ChecklistView.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 4/14/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import SwiftUI


struct ChecklistView: View {
    
    //properties
    //=========
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { idx in
                    RowView(checklistItem: self.$checklist.items[idx])
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(leading: Button(action: {self.newChecklistItemViewIsVisible = true}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Item")
                    }
            },
                                trailing: EditButton())
                .navigationBarTitle("Checklist", displayMode: .large)
            .onAppear(){
                self.checklist.printChecklistContents()
                self.checklist.saveListItems()
            }
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: self.checklist, visible: self.$newChecklistItemViewIsVisible)
        }
    }
    
    //methods
    //=======
    
}

//preview
//=======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
