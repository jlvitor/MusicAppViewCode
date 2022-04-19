//
//  HomeViewControllerScreen.swift
//  MusicAppViewCode
//
//  Created by Jean Lucas Vitor on 18/04/22.
//

import UIKit

class HomeViewControllerScreen: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.tableFooterView = UIView()
        table.showsVerticalScrollIndicator = false
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableView)
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSourve: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSourve
    }
    
    private func setUpConstraints() {
        self.tableView.pin(to: self)
    }
    
}
