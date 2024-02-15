//
//  Transaction.swift
//  Expense Tracker
//
//  Created by zhouwen on 2024/2/14.
//

import SwiftUI
import SwiftData

@Model
class Transaction {
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    // Extracting Color value from TintColor String
    @Transient
    var color: Color {
        return tints.first(where: {$0.color == tintColor})?.value ?? appTint
    }
    
    @Transient
    var tint: TintColor? {
        return tints.first(where: {$0.color == tintColor})
    }
    
    @Transient
    var rawCategory: Category? {
        return Category.allCases.first(where: {category == $0.rawValue})
    }
}

/// Sample Transactions for UI Buildin
//var sampleTransactions: [Transaction] = [
//    .init(title: "Magic Keyboard", remarks: "Apple product", amount: 129, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "Apple Music", remarks: "Subscription", amount: 10.99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "iCloud", remarks: "Subscription", amount: 0.99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "Payment", remarks: "Payment Received", amount: 2499, dateAdded: .now, category: .income, tintColor: tints.randomElement()!),
//    .init(title: "Magic Keyboard", remarks: "Apple product", amount: 129, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "Apple Music", remarks: "Subscription", amount: 10.99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "iCloud", remarks: "Subscription", amount: 0.99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
//    .init(title: "Payment", remarks: "Payment Received", amount: 2499, dateAdded: .now, category: .income, tintColor: tints.randomElement()!),
//    .init(title: "Payment", remarks: "Payment Received", amount: 2499, dateAdded: .now, category: .income, tintColor: tints.randomElement()!)
//]
