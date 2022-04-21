//
//  DetailViewControllerScreen.swift
//  MusicAppViewCode
//
//  Created by Jean Lucas Vitor on 20/04/22.
//

import UIKit

protocol DetailViewControllerScreenDelegate: AnyObject {
    func tappedCloseButton()
}

class DetailViewControllerScreen: UIView {
    
    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?
    
    private weak var delegate: DetailViewControllerScreenDelegate?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.autoresizingMask = .flexibleHeight
        view.bounces = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var cardView: CustomCardView = {
        let view = CustomCardView(mode: .full)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionsView.updateLayout(for: .full)
        view.cardContainerView.layer.cornerRadius = 0.0
        view.setUpView(data: self.cardModel ?? CardViewModel())
        return view
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        table.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        return table
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.closePressed), for: .touchUpInside)
        return button
    }()
    
    init(dataView: CardViewModel?) {
        super.init(frame: CGRect())
        self.cardModel = dataView
        DispatchQueue.main.async {
            self.setUpViews()
            self.setupConstraints()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closePressed() {
        self.delegate?.tappedCloseButton()
    }
    
    private func setUpViews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.cardView)
        self.scrollView.addSubview(self.tableView)
        self.scrollView.addSubview(self.closeButton)
    }
    
    private func setupConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        print(topPadding as Any)
        
        self.scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.cardView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -(topPadding ?? 0)),
            self.cardView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.cardView.heightAnchor.constraint(equalToConstant: 500),
            self.cardView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            
            self.tableView.topAnchor.constraint(equalTo: self.cardView.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.tableView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.tableView.heightAnchor.constraint(equalToConstant: CGFloat((80 * (cardModel?.cardList?.count ?? 0)) + 20)),
            self.tableView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            
            self.closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.closeButton.widthAnchor.constraint(equalToConstant: 30),
            self.closeButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    public func configAllDelegates(
        tableViewDelegate: UITableViewDelegate,
        tableViewDataSource: UITableViewDataSource,
        scroolViewDelegate: UIScrollViewDelegate,
        detailViewScreenDelegate: DetailViewControllerScreenDelegate) {
            self.tableView.delegate = tableViewDelegate
            self.tableView.dataSource = tableViewDataSource
            self.scrollView.delegate = scroolViewDelegate
            self.delegate = detailViewScreenDelegate
        }
}
