//
//  FlyAppTest_SUI_UITests.swift
//  FlyAppTest(SUI)UITests
//
//  Created by Borisov Nikita on 10.07.2023.
//

import XCTest
import SwiftUI

final class FlyAppTest_SUI_UITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["4 627 ₽, Москва, 20:25, MOW, 3 сент., Вс, Санкт-Петербург, 21:45, LED, 3 сент., Вс"].swipeUp()
        elementsQuery.buttons["5 001 ₽, Москва, 17:20, MOW, 3 сент., Вс, Санкт-Петербург, 18:50, LED, 3 сент., Вс"].tap()
        app.buttons["Купить билет за 5 001 ₽"].tap()
        app.alerts["Билет куплен за 5 001 ₽"].scrollViews.otherElements.buttons["Отлично"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Все билеты"].tap()
        elementsQuery.buttons["4 895 ₽, Москва, 10:10, MOW, 3 сент., Вс, Санкт-Петербург, 11:45, LED, 3 сент., Вс"].swipeDown()
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
