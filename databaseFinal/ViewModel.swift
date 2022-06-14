//
//  ViewModel.swift
//  databaseFinal
//
//  Created by Kris on 6/11/22.
//

import Foundation

class StudentViewModel: ObservableObject
{
    @Published var csvToStruct = [Student]()
    
    init(from csvName: String) {
        self.loadCSV(from: csvName)
    }
    
    func loadCSV(from csvName: String)
    {
        lazy var csvToStruct = [Student]()
        
        print("loading CSV")
        
        guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
            print("error with file path")
            return
        }
        
        
        var data = ""
        do {
            data = try String(contentsOfFile: filePath)
        } catch {
            print(error.localizedDescription)
            return
        }
        
        
        var rows = data.components(separatedBy: "\n")
        let columnCount = rows.first?.components(separatedBy: ",").count
        rows.removeFirst()
        
        for row in rows {
            let csvColumns = row.components(separatedBy: ",")
            
            if csvColumns.count == columnCount {
                let studentStruct = Student.init(raw: csvColumns)
                
                
                csvToStruct.append(studentStruct)
                
            }
        }
        
        self.csvToStruct = csvToStruct
    }
}
