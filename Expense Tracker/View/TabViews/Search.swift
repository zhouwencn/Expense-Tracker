//
//  Search.swift
//  Expense Tracker
//
//  Created by zhouwen on 2024/2/14.
//

import SwiftUI
import Combine

struct Search: View {
    
    @State private var searchText: String = ""
    @State private var filterText: String = ""
    let searchPubliser = PassthroughSubject<String, Never>()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical){
                LazyVStack(spacing: 12, content: {
                    ForEach(1...5, id: \.self) { number in
                        Text(String(number))
                    }
                })
            }
            .searchable(text: $searchText)
            .overlay(content: {
                ContentUnavailableView("Searc Transactions", systemImage: "magnifyingglass")
                    .opacity(searchText.isEmpty ? 1 : 0)
            })
            .onChange(of: searchText, { oldValue, newValue in
                if newValue.isEmpty {
                    filterText = ""
                }
                searchPubliser.send(newValue)
            })
            .onReceive(searchPubliser.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main), perform: { text in
                filterText = text
                print(text)
            })
            .navigationTitle("Search")
            .background(.gray.opacity(0.15))
            
        }
    }
}

#Preview {
    Search()
}
