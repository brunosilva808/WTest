//
//  CoreDataManager.swift
//  WTest
//
//  Created by Bruno1 on 25/03/2019.
//  Copyright © 2019 Carbon. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class CoreDataManager {
    public private(set) static var shared = CoreDataManager()

    var isEmpty : Bool {
        do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PostalCodeEntity")
            let count  = try getContext()?.count(for: request)
            return count == 0 ? true : false
        }catch{
            return true
        }
    }
    
    var searchText: String = ""
    
    var numberOfItems: Int {
        return self.getData(searchText: self.searchText).count
    }
    
    private func getContext() -> NSManagedObjectContext? {
        let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext
    }
    
    func saveData(text: String) {
        if let context = self.getContext() {
            let entity = NSEntityDescription.entity(forEntityName: "PostalCodeEntity", in: context)
            let newPostalCode = NSManagedObject(entity: entity!, insertInto: context)
            newPostalCode.setValue(text, forKey: "postalCode")
            
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
        }
    }
    
    func getData(searchText: String = "") -> [String] {
        var array:[String] = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PostalCodeEntity")
        if !searchText.isEmpty {
            request.predicate = NSPredicate(format: "postalCode CONTAINS[cd] %@", "\(searchText)")
            request.returnsObjectsAsFaults = false
        }
        
        do {
            let result = try self.getContext()?.fetch(request)
            for data in result as! [NSManagedObject] {
                let postalCode = data.value(forKey: "postalCode") as! String
                array.append(postalCode)
            }
        } catch {
            print("Failed")
        }
        
        return array
    }
}
