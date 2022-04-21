//
//  DetailTableViewCellScreen.swift
//  MusicAppViewCode
//
//  Created by Jean Lucas Vitor on 21/04/22.
//

import UIKit

class DetailTableViewCellScreen: UIView {

    lazy var thumbImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "demo")
        img.clipsToBounds = true
        img.layer.cornerRadius = 5
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jean Lucas Vitor"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Blablabla"
        label.font = UIFont.systemFont(ofSize: 15 , weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpCell(data: CardListModel) {
        self.titleLabel.text = data.listTitle
        self.subTitleLabel.text = data.listSubtitle
        self.thumbImage.image = UIImage(named: data.listImage ?? "")
    }
    
    private func addElements() {
        self.addSubview(self.thumbImage)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subTitleLabel)
        self.addSubview(self.likeButton)
        self.addSubview(self.moreButton)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.thumbImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.thumbImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.thumbImage.heightAnchor.constraint(equalToConstant: 60),
            self.thumbImage.widthAnchor.constraint(equalToConstant: 60),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor, constant: 15),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor, constant: 15),
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            
            self.moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.moreButton.widthAnchor.constraint(equalToConstant: 35),
            self.moreButton.heightAnchor.constraint(equalToConstant: 35),
            self.moreButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.likeButton.trailingAnchor.constraint(equalTo: self.moreButton.leadingAnchor, constant: -15),
            self.likeButton.widthAnchor.constraint(equalToConstant: 35),
            self.likeButton.heightAnchor.constraint(equalToConstant: 35),
            self.likeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
