//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Lucas Pereira on 10/06/23.
//

import SwiftUI

@main
struct TodoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
