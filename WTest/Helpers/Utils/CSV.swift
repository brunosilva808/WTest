//
//  CSV.swift
//  WTest
//
//  Created by Bruno Silva on 25/03/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import Foundation

public final class CSV {
    
    public private(set) static var shared = CSV()
    
    func csv(data: String) {
        let rows = data.components(separatedBy: "\n")
        var skip = true

        for row in rows {
            if skip == true {
                skip = false
                continue
            }
            if let postalCode = row.components(separatedBy: ";").first {
                DispatchQueue.main.async {
                    CoreDataManager.shared.saveData(text: self.setStringFormat(text: postalCode))
                }
            }
        }
    }
    
    func setStringFormat(text: String) -> String {
        
        let postalCodes = text.components(separatedBy: ",")
        
        if postalCodes.count > 2 {
            return postalCodes[postalCodes.count-1] + "-" + postalCodes[postalCodes.count-2] + ", " + postalCodes[postalCodes.count-3]
        }
        return ""
    }

}
