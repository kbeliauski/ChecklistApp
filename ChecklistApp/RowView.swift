//
//  Row.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 6/14/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)) {
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "🔲")
            }
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "sample item")))
    }
}
