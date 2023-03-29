//
//  MainViewModel.swift
//  MVVM1
//
//  Created by Asael Virgilio on 29/03/23.
//

import Foundation

class MainViewModel{
    
    var cellDataSource: Observable<[PokemonTableCellViewModel]> = Observable(nil)
    var dataSource: [Result] = []
    
    func numberOfRows(in section: Int) -> Int{
        dataSource.count 
    }
    func numberOfSections() -> Int{
        1
    }
    
    func getData(){
        NetworkConnection.getTrendingMovies { [weak self] result in
            guard let res = result else { return }
            self?.dataSource = result?.results ?? []
            self?.mapCellData()
            for pokemon in res.results{
                print("nombre ---> \(pokemon.name)")
            }
        }
    }
    func mapCellData(){
        self.cellDataSource.value = self.dataSource.compactMap({PokemonTableCellViewModel(result: $0)})
    }
    
}
