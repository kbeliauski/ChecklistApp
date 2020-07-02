//
//  NewChecklistItemView.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 6/13/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    var checklist: Checklist
    @Binding var visible: Bool
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    TextField("Enter new item name here", text: $newItemName)
                    Button(action: {
                        let newChecklistItem = ChecklistItem(name: self.newItemName)
                        self.checklist.items.append(newChecklistItem)
                        self.checklist.printChecklistContents()
                        self.checklist.saveListItems()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add new item")
                        }
                    
                    }
                    .disabled(newItemName.count == 0)
                }
                Text("Swipe down to cancel")
            }
            .navigationBarTitle("Add New Item")
            .navigationBarItems(trailing:
                Button(action: {self.visible = false}) {
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                }
            )
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist(), visible: .constant(true))
    }
}
