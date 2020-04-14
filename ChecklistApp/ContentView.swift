//
//  ContentView.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 4/14/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var checklistItems = ["Walk the dog", "Brush my teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"]
    var body: some View {
        NavigationView {
            List {
                    Text(checklistItems[0])
                    Text(checklistItems[1])
                    Text(checklistItems[2])
                    Text(checklistItems[3])
                    Text(checklistItems[4])
            }
            .navigationBarTitle("Checklist")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
