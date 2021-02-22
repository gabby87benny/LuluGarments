//
//  FakeLGGarmentsViewModel.swift
//  LuluGarmentsTests
//
//  Created by Gabriel on 2/21/21.
//

@testable import LuluGarments
import Foundation
import UIKit

class FakeLGGarmentsViewModel: LGGarmentsViewModel {
    var lgGarmentViewModel_saveGarmentswasCalled = false
    var lgGarmentViewModel_fetchGarmentswasCalled = false
    
    override func saveGarments(name: String, completion: (Bool, LGDatabaseError?) -> ()) {
        lgGarmentViewModel_saveGarmentswasCalled = true
    }
    
    override func retrieveGarments() {
        lgGarmentViewModel_fetchGarmentswasCalled = true
    }
}
