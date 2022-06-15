//
//  RowView.swift
//  databaseFinal
//
//  Created by Kris on 6/16/22.
//

import SwiftUI

struct studentRowView: View
{
    let student: StudentModel
    
    init(student: StudentModel) {
        print("載入 \(student.student_id)")
        self.student = student
    }
    
    var body: some View
    {
        
        VStack(alignment: .leading)
        {
            Text("Hash Index: \(student.id)")
                .font(.system(size: 14))
                .lineLimit(1)
            
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
