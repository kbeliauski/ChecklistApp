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
    
    @ObservedObject var checklist = Checklist()
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.item) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        //ternary conditional operator
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = self.checklist.item.firstIndex(where: {
                            $0.id == checklistItem.id
                        }) {
                            self.checklist.item[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.checklist.printChecklistContents()
            }
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
