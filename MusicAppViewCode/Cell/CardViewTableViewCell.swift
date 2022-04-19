//
//  CardViewTableViewCell.swift
//  MusicAppViewCode
//
//  Created by Jean Lucas Vitor on 18/04/22.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {
    
    static let identifier: String = "CardViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
