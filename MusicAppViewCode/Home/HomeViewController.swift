//
//  ViewController.swift
//  MusicAppViewCode
//
//  Created by Jean Lucas Vitor on 18/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeViewControllerScreen?
    
    //Carrega a HomeViewControllerScreen
    override func loadView() {
        self.screen = HomeViewControllerScreen()
        self.screen?.configTableViewProtocols(delegate: self, dataSourve: self)
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
}
