//
//  Settings.swift
//  Expense Tracker
//
//  Created by zhouwen on 2024/2/14.
//

import SwiftUI

struct Settings: View {
    // User properties
    @AppStorage("userName") private var userName: String = ""
    // App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    var body: some View {
        NavigationStack {
            List {
                Section("User Name") {
                    TextField("Username", text: $userName)
                }
                Section("App Lock") {
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)
                    
                    if isAppLockEnabled {
                        Toggle("Lock When App Goes Background", isOn: $lockWhenAppGoesBackground)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
