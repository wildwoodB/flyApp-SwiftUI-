//
//  File.swift
//  FlyAppTest(SUI)
//
//  Created by Borisov Nikita on 09.07.2023.
//

import SwiftUI

class MainSearcResultViewModel: ObservableObject {
    
    @Published var searchResults: [MainFlyInfo] = []
    @Published var isLoading = false
    
    //функция сортировки массива, позволяющая показать нам цену самого низкого билета сверху и присвоить ячейке нужный лейбл
    func sortByMaximum(_ model: MainFlyInfo) -> [ResultArray] {
        var newArray = model.results.sorted {$0.price.value < $1.price.value}
        newArray[0].chipest = true
        return newArray
    }
    
    //функция фетча данных и помещения их в нужный нам массив
    func fetchSearcResults() {
        isLoading = true
        NetworkManager.shared.fetchSearcResults() { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let searcResults):
                    self?.searchResults.append(searcResults)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

