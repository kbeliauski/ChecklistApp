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
                Section(header: Text("High Priority")) {
                    Group {
                        Text(checklistItems[0])
                        Text(checklistItems[1])
                        Text(checklistItems[2])
                        Text(checklistItems[3])
                        Text(checklistItems[4])
                    }
                    Group {
                        Text("Finish homework")
                        Text("Change internet provider")
                        Text("Read Raywenderlich.com")
                        Text("Clean the kitchen")
                        Text("Wash the car")
                    }
                }
                Section(header: Text("Low priority")) {
                    Text("Soccer practice")
                    Text("Eat ice cream")
                    Text("Take vocal lessons")
                    Text("Record hit single")
                    Text("Learn every martial art")
                    Text("Design costume")
                    Text("Design crime-fighting vehicle")
                    Text("Come up with superhero name")
                    Text("Befriend space raccoon")
                    Text("Save the world")
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
