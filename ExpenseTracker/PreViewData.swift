
import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/242022", institution: "Canada Int.", account: "Canada", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: false, isEdited: false)


var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
