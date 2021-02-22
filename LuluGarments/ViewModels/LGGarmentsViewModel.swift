//
//  LGGarmentsViewModel.swift
//  LuluGarments
//
//  Created by Gabriel on 2/20/21.
//

import Foundation

enum LGGarmentsSortType {
    case LGGarmentsSortTypeAlhabetical
    case LGGarmentsSortTypeCreationDate
}

class LGGarmentsViewModel {
    private var garmentsList: [LGGarment] = []
    private let databaseManager: LGDatabaseManager_Protocol
    var sortType = LGGarmentsSortType.LGGarmentsSortTypeAlhabetical

    init(garmentsList: [LGGarment] = [], dbManager: LGDatabaseManager_Protocol = LGDatabaseManager()) {
        self.garmentsList = garmentsList
        self.databaseManager = dbManager
        self.garmentsList.append(contentsOf: self.addSampleData())
    }
    
    /**
    Saves data
    */
    
    func saveGarments(name: String, completion: (Bool, LGDatabaseError?) -> ()) {
        self.garmentsList.append(LGGarment(garmentName: name))
        
        self.databaseManager.saveData(garmentName: name) { (isSaved, error) -> (Void) in
            sortGarments()
            completion(isSaved, error as? LGDatabaseError)
        }
    }
    
    /**
    Retrieves data by querying the Database
    */
    
    func retrieveGarments() {
        self.databaseManager.retrieveData { [weak self] garments, error in
            if ((error as? LGDatabaseError) != LGDatabaseError.LGDatabaseErrorNone) {
                print("Error while retrieving data from DB: \(error)")
            }
            else if garments.count > 0 {
                self?.garmentsList = garments
                self?.sortGarments()
            }
        }
    }

    func sortGarments() {
        if self.sortType == LGGarmentsSortType.LGGarmentsSortTypeAlhabetical {
            self.garmentsList = self.garmentsList.sorted { $0.garmentName.lowercased() < $1.garmentName.lowercased() }
        }
        else {
            self.garmentsList = self.garmentsList.sorted(by: { $0.addedDate.compare($1.addedDate) == .orderedDescending })
        }
    }
    
    /**
    Returns count of  garments.
     
    - Returns: Number of rows.
    */
    
    func garmentsCount() -> Int {
        return self.garmentsList.count
    }

    /**
    Returns garment info at indexpath.

    - Parameters:
       - indexPath: The indexpath to look for
     
    - Returns: The corresponding garment info at indexpath.
    */
    
    func garment(at indexPath: IndexPath) -> LGGarment? {
        guard indexPath.row < self.garmentsList.count  else { return nil }
        return garmentsList[indexPath.row]
    }
}

extension LGGarmentsViewModel {
    private func addSampleData() -> [LGGarment] {
        return [LGGarment(garmentName: "Dress", addedDate: Date().addingTimeInterval(10)), LGGarment(garmentName: "Pant", addedDate: Date().addingTimeInterval(12)), LGGarment(garmentName: "Shirt"), LGGarment(garmentName: "Tshirt", addedDate: Date().addingTimeInterval(14))]
    }
}
