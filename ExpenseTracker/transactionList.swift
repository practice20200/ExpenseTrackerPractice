

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
                //MARK: TransactionGroup
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key){ month, transactions in
                    Section{
                        //MARK: TransactionList
                        ForEach(transactions){ transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        //MARK: Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct transactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionVM = TransactionListViewModel()
        transactionVM.transactions = transactionListPreviewData
        return transactionVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView{
                TransactionList()
            }
            NavigationView{
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
