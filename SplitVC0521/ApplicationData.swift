//
//  ApplicationData.swift
//  SplitVC0521
//
//  Created by leslie on 5/23/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation
struct ApplicationData {
    var categories: [String]
    var items: [[String]]
    var items2: [String]
    var itemsData: [String: [String]]
    
    init() {
        categories = ["Fiction", "Non-Fiction", "Textbooks"]
        
        items = [["book10", "book11"], ["book1", "book3", "book5", "book6", "book7", "book8", "book12"], ["book2", "book4", "book9"]]
        
        items2 = ["book1", "book2", "book3", "book4", "book5", "book6", "book7", "book8", "book9", "book10", "book11", "book12"]
        
        itemsData = ["book1": ["Steve Jobs", "Walter Isaacson"], "book2": ["HTML5 for Masterminds", "J.D Gauchat"], "book3": ["The Road Ahead", "Bill Gates"], "book4": ["The C Programming Language", "Brian W. Kernighan"], "book5": ["Being Digital", "Nicholas Negroponte"], "book6": ["Only the Paranoid Survive", "Andrew S. Grove"], "book7": ["Accidental Empires", "Robert X. Cringely"], "book8": ["Bobby Fischer Teaches Chess", "Bobby Fischer"], "book9": ["New Guide to Science", "Isaac Asimov"], "book10": ["Christine", "Stephen King"], "book11": ["IT", "Stephen King"], "book12": ["Ending Aging", "Aubrey de Grey"]]
    }
    
}

var AppData = ApplicationData()
