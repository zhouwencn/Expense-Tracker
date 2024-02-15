//
//  ContentView.swift
//  Expense Tracker
//
//  Created by zhouwen on 2024/2/14.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    // App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    
    @State private var activeTab: Tab = .recents
    
    var body: some View {
        LockView(lockType: .biometric, lockPin: "", isEnabled: isAppLockEnabled, lockWhenAppGoesBackground: lockWhenAppGoesBackground) {
            TabView(selection: $activeTab) {
                Recents()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent }
                Search()
                    .tabItem { Tab.search.tabContent }
                    .tag(Tab.search)
                Graphs()
                    .tabItem { Tab.charts.tabContent }
                    .tag(Tab.charts)
                Settings()
                    .tabItem { Tab.settings.tabContent }
                    .tag(Tab.settings)
            }
            .sheet(isPresented: $isFirstTime, content: {
                IntroScreen()
                    .interactiveDismissDisabled()
            })
        }
    }
}

#Preview {
    ContentView()
}
