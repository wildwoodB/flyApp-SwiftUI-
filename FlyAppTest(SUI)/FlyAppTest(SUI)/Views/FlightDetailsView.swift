//
//  FlightDetailsView.swift
//  FlyAppTest(SUI)
//
//  Created by Borisov Nikita on 08.07.2023.
//

import SwiftUI

struct FlightDetailsView: View {
    
    let result: MainFlyInfo
    let flyInfo: ResultArray
    @State private var showAlert = false
    
    var body: some View {
        ZStack{
            Color(.mainBackgroundColor).edgesIgnoringSafeArea(.all)
            VStack{
                Text("\(getPriceFormatter(from: flyInfo.price.value)) \(Constants.Text.rubCharacter)")
                    .font(.system(size: 40,
                                  weight: .bold,
                                  design: .default))
                Text(Constants.Text.bestForOneTitle)
                    .font(.system(size: 13,
                                  weight: .light,
                                  design: .default))
                VStack{
                    HStack{
                        Text("\(result.origin.name) — \(result.destination.name)")
                            .font(.system(size: 17,
                                          weight: .bold,
                                          design: .default))
                            .padding([.leading,.top],20)
                        Spacer()
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 360 ,height: 160)
                            .cornerRadius(10)
                        VStack(alignment: .leading){
                            HStack {
                                Image("\(flyInfo.airline)")
                                Text("\(flyInfo.airline)")
                                    .font(.system(size: 15,
                                                  weight: .semibold,
                                                  design: .default))
                                    .foregroundColor(.black)
                                    .padding()
                                Spacer()
                            }
                            HStack {
                                Text("\(result.origin.name)")
                                    .font(.system(size: 15,
                                                  weight: .semibold,
                                                  design: .default))
                                
                                Spacer()
                                
                                Text("\(getTime(from: flyInfo.departureDateTime))")
                            } // точка отправления
                            HStack {
                                Text("\(result.origin.iata)")
                                    .font(.system(size: 13,
                                                  weight: .regular,
                                                  design: .default))
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                Text("\(getDateAndDayOfWeek(from: flyInfo.arrivalDateTime))")
                                    .font(.system(size: 13,
                                                  weight: .regular,
                                                  design: .default))
                                    .foregroundColor(.secondary)
                            }
                            HStack {
                                Text("\(result.destination.name)")
                                    .font(.system(size: 15,
                                                  weight: .semibold,
                                                  design: .default))
                                
                                Spacer()
                                
                                Text("\(getTime(from: flyInfo.arrivalDateTime))")
                            }// точка прибытия
                            HStack {
                                Text("\(result.destination.iata)")
                                    .font(.system(size: 13,
                                                  weight: .regular,
                                                  design: .default))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("\(getDateAndDayOfWeek(from: flyInfo.arrivalDateTime))")
                                    .font(.system(size: 13,
                                                  weight: .regular,
                                                  design: .default))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                    }
                    .padding([.trailing,.leading,.bottom])
                    Spacer()
                    Button(action: {
                        showAlert = true
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(.buyButton))
                                .frame(width: 359 ,height: 48)
                                .cornerRadius(10)
                            Text("\(Constants.Text.buyTicketFor) \(getPriceFormatter(from: flyInfo.price.value)) \(Constants.Text.rubCharacter)")
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                    }
                    .padding(.bottom)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("\(Constants.Text.tecketAlredyDone) \(getPriceFormatter(from: flyInfo.price.value)) \(Constants.Text.rubCharacter)"),
                              dismissButton: .default(Text("\(Constants.Text.alarmButton1)")))
                    }
                }
            }
        }
        .background(Color(.mainBackgroundColor))
    }
}

