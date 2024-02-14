//
//  ContentView.swift
//  Expense Tracker
//
//  Created by zhouwen on 2024/2/14.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    @State private var activeTab: Tab = .recents
    
    var body: some View {
        TabView(selection: $activeTab) {
            Text("Recents")
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            Text("Search")
                .tabItem { Tab.search.tabContent }
                .tag(Tab.search)
            Text("Charts")
                .tabItem { Tab.charts.tabContent }
                .tag(Tab.charts)
            Text("Settings")
                .tabItem { Tab.settings.tabContent }
                .tag(Tab.settings)
        }
//        .onChange(of: activeTab) {
//            print("Current time: \(activeTab.rawValue)")
//        }
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
