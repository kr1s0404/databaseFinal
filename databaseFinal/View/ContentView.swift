//
//  ContentView.swift
//  databaseFinal
//
//  Created by Kris on 6/11/22.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var vm = StudentViewModel(from: "DB_students_tc_utf8")
    
    var body: some View
    {
        ScrollView
        {
            SearchModeView(selectedIndex: $vm.selectedIndex)
            
            SearchBar(searchText: $vm.searchText)
                .padding()
                .onSubmit {
                    vm.filterResult()
                }
            
            
            LazyVStack(alignment: .leading, spacing: 5)
            {
                ForEach(vm.searchText.isEmpty ? vm.studentData : vm.searchResult) { student in
                    RowView(student: student)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
