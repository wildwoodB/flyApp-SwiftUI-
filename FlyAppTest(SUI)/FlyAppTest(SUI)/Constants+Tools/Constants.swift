//
//  Constants.swift
//  FlyAppTest(SUI)
//
//  Created by Borisov Nikita on 09.07.2023.
//

import Foundation

//MARK: - Some Text Elements Enum
enum Constants {
    enum Text {
        static let navigationBarText1 = "Москва — Санкт-Петербург"
        static let navigationBarText2 = "3 сентября, 1 чел"
        static let navigationTitle = "Все билеты"
        static let bestForOneTitle = "Лучшая цена за 1 чел"
        static let buyTicketFor = "Купить билет за"
        static let tecketAlredyDone = "Билет куплен за"
        static let rubCharacter = "₽"
        static let chipestPrice = "Самый дешевый "
        static let alarmButton1 = "Отлично"
        static let ticketCount1 = "Осталось"
        static let ticketCount2 = "билетов по этой цене"
    }
}

enum TimeOrDate: String {
    case needTime = "HH:mm"
    case needDate = "MMM, EE"
}
