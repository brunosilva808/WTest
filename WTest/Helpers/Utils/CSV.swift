//
//  CSV.swift
//  WTest
//
//  Created by Bruno1 on 25/03/2019.
//  Copyright © 2019 Carbon. All rights reserved.
//

import Foundation

public final class CSV {
    
    public private(set) static var shared = CSV()
    var postalCodes: [[String]] = []
    
    func csv(data: String) {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        var skip = true

        for row in rows {
            if skip == true {
                skip = false
                continue
            }
            let columns = row.components(separatedBy: ";")
            result.append(columns)
        }
        
        self.postalCodes = result
    }
    
    func getRow(_ row: Int) -> String {
        let postalCodes = self.postalCodes[row].first?.components(separatedBy: ",")
        
        if  let count = postalCodes?.count,
            count > 2,
            let city = postalCodes?[count-1],
            let streetPostalCode = postalCodes?[count-2],
            let postalCode = postalCodes?[count-3]{
            return postalCode + "-" + streetPostalCode + ", " + city
        }
        return ""
    }
}
