//
//  model.swift
//  databaseFinal
//
//  Created by Kris on 6/11/22.
//

import SwiftUI

struct StudentModel: Identifiable, Codable, Hashable
{
    let id: String = UUID().uuidString
    let student_id: String
    let course_id: String
    let course_name: String
}


//struct Student: Identifiable
//{
//    let id: String = UUID().uuidString
//    var student_id: String = ""
//    var course_id: String = ""
//    var course_name: String = ""
//
//    init(raw: [String]) {
//        student_id  = raw[0]
//        course_id   = raw[1]
//        course_name = raw[2]
//    }
//}
//
//
//func loadCSV(from csvName: String) -> [Student]
//{
//    var csvToStruct = [Student]()
//
//    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else { return [] }
//
//
//    var data = ""
//    do {
//        data = try String(contentsOfFile: filePath)
//    } catch {
//        print(error.localizedDescription)
//        return []
//    }
//
//
//    var rows = data.components(separatedBy: "\n")
//    let columnCount = rows.first?.components(separatedBy: ",").count
//    rows.removeFirst()
//
//    for row in rows {
//        let csvColumns = row.components(separatedBy: ",")
//
//        if csvColumns.count == columnCount {
//            let studentStruct = Student.init(raw: csvColumns)
//            csvToStruct.append(studentStruct)
//        }
//    }
//
//    return csvToStruct
//}

