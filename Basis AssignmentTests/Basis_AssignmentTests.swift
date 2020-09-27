//
//  Basis_AssignmentTests.swift
//  Basis AssignmentTests
//
//  Created by Abdul chaudhary on 26/09/20.
//

import XCTest
@testable import Basis_Assignment

class Basis_AssignmentTests: XCTestCase {
    
    
    func testApiCall() {
        let test = ViewController()
        test.getData()
        XCTAssertNotNil(test)
    }
    

}
