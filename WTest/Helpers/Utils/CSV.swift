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
    var postalCodes: [String] = []
    
    func csv(data: String) {
        var result: [String] = []
        let rows = data.components(separatedBy: "\n")
        var skip = true

        for row in rows {
            if skip == true {
                skip = false
                continue
            }
            if let columns = row.components(separatedBy: ";").first {
                result.append(setStringFormat(text: columns))
            }
        }
        
        self.postalCodes = result
    }
    
    func setStringFormat(text: String) -> String {
        
        let postalCodes = text.components(separatedBy: ",")
        
        if postalCodes.count > 2 {
            return postalCodes[postalCodes.count-1] + "-" + postalCodes[postalCodes.count-2] + ", " + postalCodes[postalCodes.count-3]
        }
        return ""
    }
    
    func getText(row: Int) -> String {
        return self.postalCodes[row]
    }
}
