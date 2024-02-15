//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by zhouwen on 2024/2/14.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Transaction.self])
    }
}
