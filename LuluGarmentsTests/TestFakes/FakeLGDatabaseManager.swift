//
//  FakeLGDatabaseManager.swift
//  LuluGarmentsTests
//
//  Created by Gabriel on 2/21/21.
//

import Foundation
@testable import LuluGarments

class FakeLGDatabaseManager: LGDatabaseManager_Protocol {
    var dbManager_SaveDataCalled = false
    var dbManager_RetreiveDataCalled = false

    func saveData(garmentName:String, completion: (Bool, Error) -> (Void)) {
        dbManager_SaveDataCalled = true
    }
    
    func retrieveData(completion: ([LGGarment], Error) -> (Void)) {
        dbManager_RetreiveDataCalled = true
    }
}
