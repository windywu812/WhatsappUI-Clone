//
//  CallViewController.swift
//  WhatsappClone
//
//  Created by Windy on 25/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class CallViewController: UITableViewController {
    
    let searchController = UISearchController()
    let segmentedController: UISegmentedControl = {
        let segmentedController = UISegmentedControl()
        segmentedController.insertSegment(withTitle: "All", at: 0, animated: true)
        segmentedController.insertSegment(withTitle: "Missed", at: 1, animated: true)
        segmentedController.selectedSegmentIndex = 0
        return segmentedController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.reuseIdentifier)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Calls"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "phone.badge.plus"), style: .plain, target: self, action: nil)
        navigationItem.titleView = segmentedController
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.reuseIdentifier, for: indexPath) as! ContactCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

class ContactCell: UITableViewCell {
    
    static let reuseIdentifier = "ContactCell"
    
    let profilePic = UIImageView()
    let name = UILabel()
    let status = UILabel()
    let timeStamp = UILabel()
    let infoButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profilePic.image = UIImage(systemName: "person.circle")
        
        name.text = "User"
        name.font = .preferredFont(forTextStyle: .subheadline)
        
        status.text = "Outgoing"
        status.font = .preferredFont(forTextStyle: .subheadline)
        status.textColor = .secondaryLabel
        
        let labelStackView = UIStackView(arrangedSubviews: [name, status])
        labelStackView.axis = .vertical
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        timeStamp.text = "Yesterday"
        timeStamp.font = .preferredFont(forTextStyle: .subheadline)
        
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        
        let leftStackView = UIStackView(arrangedSubviews: [profilePic, labelStackView])
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.alignment = .center
        leftStackView.spacing = 8
        contentView.addSubview(leftStackView)
        
        let rightStackView = UIStackView(arrangedSubviews: [timeStamp, infoButton])
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.spacing = 8
        contentView.addSubview(rightStackView)
        
        NSLayoutConstraint.activate([
            profilePic.widthAnchor.constraint(equalToConstant: 40),
            profilePic.heightAnchor.constraint(equalToConstant: 40),
            
            leftStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            leftStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            rightStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
