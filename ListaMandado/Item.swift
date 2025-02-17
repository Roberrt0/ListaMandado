//
//  File.swift
//  ListaMandado
//
//  Created by Luis Roberto Martinez on 11/02/25.
//

import Foundation

struct Item: Identifiable, Equatable {
    
    let id: String
    let name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
    
}
