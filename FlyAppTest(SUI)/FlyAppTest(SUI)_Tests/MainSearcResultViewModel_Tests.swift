//
//  FlyAppTest_SUI__Tests.swift
//  FlyAppTest(SUI)_Tests
//
//  Created by Borisov Nikita on 10.07.2023.
//

import XCTest
@testable import FlyAppTest_SUI_

final class MainSearcResultViewModel_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_MainSearcResultViewModel() throws {
        
        let viewModel = MainSearcResultViewModel()
        
        let expectation = XCTestExpectation(description: "Fetch search results")
        
        viewModel.fetchSearcResults()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(viewModel.searchResults.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
