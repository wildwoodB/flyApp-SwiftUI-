//
//  ContentView.swift
//  FlyAppTest(SUI)
//
//  Created by Borisov Nikita on 07.07.2023.
//

import SwiftUI

struct MainSearcResultView: View {
    
    @StateObject private var viewModel = MainSearcResultViewModel()
    
    var body: some View {
        ZStack{
            NavigationView {
                ZStack{
                    Color(.mainBackgroundColor).edgesIgnoringSafeArea(.all)
                    VStack {
                        VStack {
                            Text(Constants.Text.navigationBarText1)
                                .font(.system(size: 15,
                                              weight: .semibold,
                                              design: .default))
                            Text(Constants.Text.navigationBarText2)
                                .font(.system(size: 13,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(.secondary)
                        }
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack(alignment: .center, spacing: -35) {
                                ForEach(viewModel.searchResults, id: \.id) { result in
                                    let new = viewModel.sortByMaximum(result)
                                    ForEach(new) { model in
                                        NavigationLink(destination: FlightDetailsView(result: result, flyInfo: model)) {
                                            SearchResultItem(result: result, flyInfo: model)
                                                .foregroundColor(Color.black)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        })
                    }
                }
                .navigationBarHidden(true)
                .navigationTitle(Constants.Text.navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear { viewModel.fetchSearcResults() }
            if viewModel.isLoading { LoadingView() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearcResultView()
    }
}


