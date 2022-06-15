//
//  ViewModel.swift
//  databaseFinal
//
//  Created by Kris on 6/11/22.
//

import SwiftUI
import CodableCSV

final class StudentViewModel: ObservableObject
{
    @Published var studentData = [StudentModel]()
    @Published var searchResult: [StudentModel] = []
    @Published var searchText: String = ""
    var selectedIndex: Int = 0
    
    init(from csvName: String) {
        self.load(from: csvName)
    }
    
    func load(from csvName: String)
    {
        guard let filePath = Bundle.main.url(forResource: csvName, withExtension: "csv") else {
            print("DEBUG: error with file path")
            return
        }
        
        do {
            
            let decoder = try CSVDecoder {
                $0.encoding = .utf8
                $0.headerStrategy = .firstLine
                $0.bufferingStrategy = .sequential
                $0.delimiters.field = ","
                $0.delimiters.row = "\n"
            }.lazy(from: filePath)
            
            
            let data = try decoder.map { try $0.decode(StudentModel.self) }
            self.studentData = data
            
        } catch {
            print(error)
        }
    }
    
    func filterResult()
    {
        if selectedIndex == 0 {
            searchResult = studentData.filter({ $0.student_id.contains(searchText) })
        } else if selectedIndex == 1 {
            searchResult = studentData.filter({ $0.course_id.contains(searchText) })
        } else {
            searchResult = studentData.filter({ $0.course_name.contains(searchText) })
        }
    }
}
