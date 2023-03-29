//
//  ViewController.swift
//  MVVM1
//
//  Created by Asael Virgilio on 28/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel = MainViewModel()
    var cellDataSource: [PokemonTableCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func configView(){
        self.title = "Main View"
        setupTableView()
    }
    
    func bindViewModel(){
        viewModel.cellDataSource.bind { [weak self] results in
            guard let self = self, let results = results else { return }
            
            self.cellDataSource = results
            self.reloadTableView()
        }
    }

}

