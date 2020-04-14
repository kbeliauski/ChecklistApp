//
//  ContentView.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 4/14/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("High Priority")) {
                    Text("Walk the dog")
                    Text("Brush my teeth")
                    Text("Learn iOS development")
                }
                Section(header: Text("Low priority")) {
                    Text("Soccer practice")
                    Text("Eat ice cream")
                }
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
