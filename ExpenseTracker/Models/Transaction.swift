

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: {$0.id == categoryId}){
            return category.icon
        }
        return .question
    }
    
    var dateParsed: Date{
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount: -amount
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}


enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCatrgoryId: Int?
}

extension Category {
    //MARK: categories
    static var autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static var billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static var entertainment = Category(id: 3, name: "Entertainment", icon: .car_alt)
    static var feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: .hand_holding_usd)
    static var foodAndDining = Category(id: 5, name: "Food & Dining", icon: .hamburger)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    //MARK: subCategories
    static let publicTransportation = Category(id: 101, name: "Public & Transportation", icon: .bus, mainCatrgoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi,mainCatrgoryId: 1)
    static let mobilePhone = Category(id: 201, name: "mobile Phone", icon: .mobile_alt,mainCatrgoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: .taxi,mainCatrgoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", icon: .hand_holding_usd, mainCatrgoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .taxi,mainCatrgoryId: 4)
    static let groceries = Category(id: 501, name: "Grocieries", icon: .taxi,mainCatrgoryId: 5)
    static let restaurants = Category(id: 502, name: "Finance Charge", icon: .taxi,mainCatrgoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, mainCatrgoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .taxi,mainCatrgoryId: 6)
    static let paychequw = Category(id: 701, name: "Paycheque", icon: .taxi,mainCatrgoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: .taxi,mainCatrgoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .taxi,mainCatrgoryId: 9)
}

extension Category{
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paychequw,
        .software,
        .creditCardPayment
    ]
    
    static let all: [Category] = categories + subCategories
    
}
