//
//  DetailTableViewCell.swift
//  MusicAppViewCode
//
//  Created by Jean Lucas Vitor on 21/04/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "DetailTableViewCell"
    
    var screen: DetailTableViewCellScreen = DetailTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setUpViews()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        self.contentView.addSubview(self.screen)
    }
    
    private func setUpConstraints() {
        self.screen.pin(to: self.contentView)
    }
    
    public func setUpCell(data: CardListModel) {
        self.screen.setUpCell(data: data)
    }
    
}
