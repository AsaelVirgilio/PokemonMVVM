//
//  PokemonViewModel.swift
//  MVVM1
//
//  Created by Asael Virgilio on 29/03/23.
//

import Foundation

class PokemonTableCellViewModel{
    var name: String
    
    init(result: Result?) {
        self.name = result?.name ?? ""
    }
}
