//
//  PokemonTableViewCell.swift
//  MVVM1
//
//  Created by Asael Virgilio on 29/03/23.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    public static var identifier: String{
        get{
            return "PokemonCell"
        }
    }
    
    public static func register() -> UINib{
        UINib(nibName: "PokemonTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblURL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupCell(viewModel: PokemonTableCellViewModel){
        self.lblName.text = viewModel.name
    }
}
