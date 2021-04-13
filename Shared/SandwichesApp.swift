//
//  SandwichesApp.swift
//  Shared
//
//  Created by Alejo Acosta on 6/25/20.
//

import SwiftUI

@main
struct SandwichesApp: App {
    //@StateObject private var store = SandwichStore()
    @StateObject private var store = testStore
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
