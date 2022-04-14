//
//  data.swift
//  List
//
//  Created by user216710 on 4/14/22.
//

import Foundation

struct csv: Identifiable{
    var Country: String = ""
    var code: String = ""
    var id = UUID()
    
    init(raw: [String]){
        Country = raw[0]
        code = raw[1]
    }
}


func loadCSV(from csvName: String) -> [csv]{
    var csvToStruct = [csv]()
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv")else {
        return []
    }
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    }catch {
        print(error)
        return []
    }
    var rows = data.components(separatedBy: "\n")
    let columnCount = rows.first?.components(separatedBy: ",").count
    
    rows.removeFirst()
    for row in rows{
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == columnCount{
            let dataStruct = csv.init(raw: csvColumns)
            csvToStruct.append(dataStruct)
        }
    }
    return csvToStruct
}

