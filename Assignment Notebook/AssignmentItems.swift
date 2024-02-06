//
//  AssignmentItems.swift
//  Assignment Notebook
//
//  Created by Phillip Mantatsky on 2/5/24.
//

import Foundation
class AssignmentItems: ObservableObject {
    
    @Published var items : [AssignmentItems] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItems].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
