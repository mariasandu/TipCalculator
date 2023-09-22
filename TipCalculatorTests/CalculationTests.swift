//
//  CalculationTests.swift
//  TipCalculatorTests
//
//  Created by Maria Sandu on 22.09.2023.
//

import XCTest
@testable import TipCalculator

final class CalculationTests: XCTestCase {
    
    func testSuccessfulTipCalculation() {
        // Given (Arrange)
        let enteredAmount = 100.00
        let tipSlider = 25.0
        let calculation = Calculation()
        
        // When (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertEqual(tip, 25)
    }

    func testNegativeEnteredTipCalculation() {
        // Given (Arrange)
        let enteredAmount = -100.00
        let tipSlider = 25.0
        let calculation = Calculation()
        
        // When (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertNil(tip)
    }
    
}
