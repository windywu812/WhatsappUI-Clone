//
//  ViewController.swift
//  WhatsappClone
//
//  Created by Windy on 25/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class ChatViewController: UITableViewController {
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
        
        tableView.register(ChatCell.self, forCellReuseIdentifier: ChatCell.reuseIdentifier)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Chats"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        navigationItem.searchController = searchController
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.reuseIdentifier, for: indexPath) as! ChatCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

class ChatCell: UITableViewCell {
    
    static let reuseIdentifier = "ChatCell"
    
    let profilePic = UIImageView()
    let name = UILabel()
    let messageDesc = UILabel()
    let timeStamp = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profilePic.image = UIImage(systemName: "person.circle")
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        
        name.text = "Unknown User"
        name.font = .preferredFont(forTextStyle: .headline)
        
        messageDesc.text = "Lorep isum Lorep isum Lorep Lorep isum Lorep isum Lorep Lorep isum Lorep isum Lorep"
        messageDesc.numberOfLines = 2
        messageDesc.font = .preferredFont(forTextStyle: .subheadline)
        messageDesc.textColor = .secondaryLabel
        
        timeStamp.text = "14.22"
        timeStamp.font = .preferredFont(forTextStyle: .subheadline)
        timeStamp.translatesAutoresizingMaskIntoConstraints = false
        timeStamp.textColor = .secondaryLabel
        contentView.addSubview(timeStamp)
        
        let messageStackView = UIStackView(arrangedSubviews: [name, messageDesc])
        messageStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [profilePic, messageStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.alignment = .center
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            profilePic.widthAnchor.constraint(equalToConstant: 64),
            profilePic.heightAnchor.constraint(equalToConstant: 64),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: timeStamp.leadingAnchor, constant: -8),
            
            timeStamp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            timeStamp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ])
        
        timeStamp.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
