//
//  ContentView.swift
//  databaseFinal
//
//  Created by Kris on 6/11/22.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var viewModel = StudentViewModel(from: "DB_students_tc_utf8")
    
    var body: some View
    {
        ScrollView
        {
            SearchModeView(selectedIndex: $viewModel.selectedIndex)
            
            SearchBar(searchText: $viewModel.searchText)
                .padding()
                .onSubmit {
                    viewModel.filterResult()
                }
            
            
            LazyVStack(alignment: .leading, spacing: 5)
            {
                ForEach(searchResult()) { student in
                    studentRowView(student: student)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            }
        }
    }
    
    func searchResult() -> [StudentModel] {
        return viewModel.searchText.isEmpty ? viewModel.studentData : viewModel.searchResult
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
