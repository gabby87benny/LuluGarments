//
//  LGDatabaseManager.swift
//  LuluGarments
//
//  Created by Gabriel on 2/20/21.
//

import Foundation
import UIKit
import CoreData

protocol LGDatabaseManager_Protocol {
    func saveData(garmentName:String, completion: (Bool, Error) -> (Void))
    func retrieveData(completion: ([LGGarment], Error) -> (Void))
}

enum LGDatabaseError: Error {
    case LGDatabaseErrorNone
    case LGDatabaseErrorSave
    case LGDatabaseErrorFetch
}

class LGDatabaseManager: LGDatabaseManager_Protocol {
    
    var dbError = LGDatabaseError.LGDatabaseErrorNone
    
    init() {
        
    }
    
    func saveData(garmentName:String, completion: (Bool, Error) -> (Void)) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "Garment", in: managedContext)!
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user.setValue(Date(), forKey: "createdDate")
        user.setValue(garmentName, forKey: "garmentName")
        
        do {
            try managedContext.save()
            completion(true, dbError)
        }
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            dbError = LGDatabaseError.LGDatabaseErrorSave
            completion(false, dbError)
        }
    }
    
    func retrieveData(completion: ([LGGarment], Error) -> (Void)) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Garment")
        
        do {
            var garmentsList = [LGGarment]()
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                var garment = LGGarment()
                garment.garmentName = data.value(forKey: "garmentName") as! String
                garment.addedDate = data.value(forKey: "createdDate") as! Date
                garmentsList.append(garment)
            }
            
            completion(garmentsList, dbError)
        }
        catch {
            print("Failed")
            dbError = LGDatabaseError.LGDatabaseErrorFetch
            completion([], dbError)
        }
    }
}
