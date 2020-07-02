//
//  Checklist.swift
//  ChecklistApp
//
//  Created by Kiryl Beliauski on 6/10/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import Foundation

class Checklist: ObservableObject {
    
    @Published var items: [ChecklistItem] = []
    
    init() {
        print("Documents directory is \(documentsDirectory())")
        print("Data file path is: \(dataFilePath())")
        loadListItems()
    }
    
    func printChecklistContents() {
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        self.items.remove(atOffsets: whichElement)
        saveListItems()
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
        saveListItems()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklist.plist")
    }
    
    func saveListItems() {
        //1. “First, the method creates an instance of PropertyListEncoder, a type of object that Apple operating systems use to encode the data stored in an app’s objects into a property list.”
        let encoder = PropertyListEncoder()
        //2 “The do keyword, which you haven’t encountered before, sets up the first of two blocks of code, which are Swift’s way of catching errors that might come up when the program is running.”
        do {
            //3. “Here, you call the encoder’s encode() method to encode the items array. The method could fail. It throws an error if it’s unable to encode the data for some reason: Perhaps it’s not in the expected format, or it’s corrupted, or the device’s flash drive is unavailable.”
            let data = try encoder.encode(items)
            
            //4. “If the call to encode() succeeds, data now contains the contents of the items array in encoded form. This line attempts to write this encoded data to a file using the file path returned by a call to dataFilePath(). The write() method, like many file operations, can fail for many reasons and throw an error. Once again, you have to make use of a try statement, so the catch block can handle the case where write() fails.”
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            //5. “This is the start of the catch block, which contains the code to execute if any line of code in the do block threw an error.”
        } catch {
            //6. “This is the code that executes if code in the do block throws an error. If you were planning to sell this app in the App Store, you might do all kinds of things with this code to deal with cases where encoding the data or writing it to the device’s file system fails. In this case, you’ll simply print out an error message to Xcode’s console.
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadListItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([ChecklistItem].self, from: data)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
