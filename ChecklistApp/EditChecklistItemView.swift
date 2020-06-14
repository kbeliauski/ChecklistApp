//
//  EditChecklistItemView.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 6/12/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "sample item")))
    }
}
