//
//  SearchResultItem.swift
//  FlyAppTest(SUI)
//
//  Created by Borisov Nikita on 07.07.2023.
//

import SwiftUI

struct SearchResultItem: View {
    
    let result: MainFlyInfo
    let flyInfo: ResultArray
    
    var body: some View {
        ZStack{
            VStack{
                VStack(alignment: .leading){
                    HStack {
                        Text("\(getPriceFormatter(from: flyInfo.price.value)) \(Constants.Text.rubCharacter)")
                            .font(.system(size: 19,
                                          weight: .semibold,
                                          design: .default))
                            .foregroundColor(.accentColor)
                        Spacer()
                        Image("\(flyInfo.airline)")
                    }
                    HStack{
                        if flyInfo.availableTicketsCount <= 9 {
                            Text("\(Constants.Text.ticketCount1) \(flyInfo.availableTicketsCount) \(Constants.Text.ticketCount2)")
                                .font(.system(size: 13,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(.red)
                        }
                    }
                    Spacer()
                    HStack {
                        Text("\(result.origin.name)")
                            .font(.system(size: 15,
                                          weight: .semibold,
                                          design: .default))
                        Spacer()
                        Text("\(getTime_Date(from: flyInfo.departureDateTime, caseUse: .needTime))")
                    } // точка отправления
                    HStack {
                        Text("\(result.origin.iata)")
                            .font(.system(size: 13,
                                          weight: .regular,
                                          design: .default))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("\(getTime_Date(from: flyInfo.arrivalDateTime, caseUse: .needDate))")
                            .font(.system(size: 13,
                                          weight: .regular,
                                          design: .default))
                            .foregroundColor(.secondary)
                    }
                    .padding(.bottom,1)
                    HStack {
                        Text("\(result.destination.name)")
                            .font(.system(size: 15,
                                          weight: .semibold,
                                          design: .default))
                        Spacer()
                        Text("\(getTime_Date(from: flyInfo.arrivalDateTime, caseUse: .needTime))")
                    }// точка прибытия
                    HStack {
                        Text("\(result.destination.iata)")
                            .font(.system(size: 13,
                                          weight: .regular,
                                          design: .default))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("\(getTime_Date(from: flyInfo.arrivalDateTime, caseUse: .needDate))")
                            .font(.system(size: 13,
                                          weight: .regular,
                                          design: .default))
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
            .padding(.top)
            if flyInfo.chipest ?? false {
                ZStack(){
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(.minPriceDeck))
                        .frame(width: 150,height: 20)
                        .position(x: 75,y: 9)
                    
                        .frame(width: 360 ,height: 180)
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("\(Constants.Text.chipestPrice)")
                            .foregroundColor(.white)
                            .font(.system(size: 15,
                                          weight: .semibold,
                                          design: .default))
                            .position(x: 85,y: 19)
                    }
                }
            }
        }
        .frame(width: 380 ,height: 182)
        .background(Color.clear)
        .cornerRadius(10)
        .padding()
    }
}
