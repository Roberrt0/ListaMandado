//
//  ViewModel.swift
//  ListaMandado
//
//  Created by Luis Roberto Martinez on 11/02/25.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var itemList: [Item] = []
    @Published var txt: String = ""
    
    init() {
        getItems()
    }
    
    // añade 5 items predeterminados
    func getItems() {
        let newItems: [Item] = [
            .init(name: "lechuga"),
            .init(name: "sandia"),
            .init(name: "mangos"),
            .init(name: "Huevos"),
            .init(name: "carne")
        ]
        
        itemList.append(contentsOf: newItems)
    }
    
    func add() {
        if txt == "" { return }
        
        let newItem = Item(name: txt)
        itemList.append(newItem)
        txt = ""
    }
    
    func delete(_ index: IndexSet) {
        itemList.remove(atOffsets: index)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        itemList.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}
