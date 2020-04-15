//
//  ContentView.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 4/14/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = [
          "Take vocal lessons",
          "Record hit single",
          "Learn every martial art",
          "Design costume",
          "Design crime-fighting vehicle",
          "Come up with superhero name",
          "Befriend space raccoon",
          "Save the world",
          "Star in blockbuster movie",
        ]
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self) { item in
                    Text(item)
                        .onTapGesture {
                            let indexesToRemove = IndexSet(integersIn: 0...4)
                            self.checklistItems.remove(atOffsets: indexesToRemove)
                            self.printChecklistContents()
                    }
                }
            }
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
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
