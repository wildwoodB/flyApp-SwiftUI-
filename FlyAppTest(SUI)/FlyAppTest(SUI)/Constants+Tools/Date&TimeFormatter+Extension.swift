//
//  DateFormatter.swift
//  FlyAppTest(SUI)
//
//  Created by Borisov Nikita on 08.07.2023.
//

import Foundation
import SwiftUI

//MARK: - View Date/Time/Price Formatter
extension View {
    
    func getTime_Date(from string: String, caseUse: TimeOrDate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: string) {
            dateFormatter.dateFormat = caseUse.rawValue
            return dateFormatter.string(from: date)
        } else {
            return "nil"
        }
    }
    
    func getPriceFormatter(from: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        let new = numberFormatter.string(from: NSNumber(value: from))
        let formattedString = new?.replacingOccurrences(of: ",", with: " ")
        return formattedString ?? "nil"
    }
}



