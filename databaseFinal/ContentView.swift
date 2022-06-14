//
//  ContentView.swift
//  databaseFinal
//
//  Created by Kris on 6/11/22.
//

import SwiftUI

struct ContentView: View
{
    @State var Students = loadCSV(from: "DB_students_tc_utf8")
    @State var tempStudents: [Student] = []
    @State var searchText: String = ""
    
    let searchMode = ["studentID", "courseID", "courseName"]
    @State var selectedIndex: Int = 0
    
    
    var body: some View
    {
        ScrollView
        {
            Picker("搜尋模式", selection: $selectedIndex)
            {
                Text(searchMode[0])
                    .tag(0)
                Text(searchMode[1])
                    .tag(1)
                Text(searchMode[2])
                    .tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.vertical, 5)
            
            SearchBar(text: $searchText)
                .padding()
                .onSubmit {
                    if selectedIndex == 0 {
                        tempStudents = Students.filter({ $0.student_id.contains(searchText) })
                    } else if selectedIndex == 1 {
                        tempStudents = Students.filter({ $0.course_id.contains(searchText) })
                    } else {
                        tempStudents = Students.filter({ $0.course_name.contains(searchText) })
                    }
                }
            
            
            LazyVStack(alignment: .leading, spacing: 5)
            {
                ForEach(searchText.isEmpty ? Students : tempStudents ) { student in
                    RowView(student: student)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            }
        }
    }
}

struct RowView: View
{
    let student: Student
    
    init(student: Student) {
        print("載入 \(student.student_id)")
        self.student = student
    }
    
    var body: some View
    {
        
        VStack(alignment: .leading)
        {
            Text("Hash Index: \(student.id)")
                .font(.system(size: 14))
            Text("Student ID: \(student.student_id)")
                .bold()
                .font(.title)
            Text("選課代號：\(student.course_id)")
                .font(.title2)
            Text("課程名稱：\(student.course_name)")
                .font(.title2)
        }
        Divider()
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
