//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Apple New on 2022-05-05.
//

import SwiftUI
import SwiftUICharts


struct ContentView: View {
    
    var body: some View {
        let demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24) {
                    //MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: Chart
                    CardView {
                        VStack{
                            ChartLabel("$900", type: .title)
                            LineChart()
                        }
                        .background(Color.systemBackground)
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                    .frame(height: 300)
                    
                    //MARK: TransactionList
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionVM = TransactionListViewModel()
        transactionVM.transactions = transactionListPreviewData
        return transactionVM
    }()
    
    static var previews: some View {
        Group{
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
