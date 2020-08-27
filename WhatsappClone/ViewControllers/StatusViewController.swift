//
//  StatusViewController.swift
//  WhatsappClone
//
//  Created by Windy on 25/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class StatusViewController: UITableViewController {
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Status"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Privacy", style: .plain, target: self, action: nil)
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        tableView.contentInset.top = 32
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return MyStatusCell()
        default:
            return UpdateCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }
        return 44
    }
    
}

class MyStatusCell: UITableViewCell {
    
    let profileImage = UIImageView()
    let myStatusLabel = UILabel()
    let descriptionLabel = UILabel()
    let cameraButton = UIButton()
    let writeButton = UIButton()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profileImage.image = UIImage(systemName: "person.crop.circle")
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        myStatusLabel.text = "My Status"
        myStatusLabel.font = .preferredFont(forTextStyle: .headline)
        
        descriptionLabel.text = "Add to my status"
        descriptionLabel.font = .preferredFont(forTextStyle: .subheadline)
        descriptionLabel.textColor = .secondaryLabel
        
        let labelStackView = UIStackView(arrangedSubviews: [myStatusLabel, descriptionLabel])
        labelStackView.axis = .vertical
        labelStackView.alignment = .leading
        labelStackView.spacing = 8
        
        cameraButton.setBackgroundImage(UIImage(systemName: "camera.circle"), for: .normal)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        writeButton.setBackgroundImage(UIImage(systemName: "pencil.circle"), for: .normal)
        writeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonStackView = UIStackView(arrangedSubviews: [cameraButton, writeButton])
        buttonStackView.axis = .horizontal
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.spacing = 4
        contentView.addSubview(buttonStackView)
        
        let stackView = UIStackView(arrangedSubviews: [profileImage, labelStackView])
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 64),
            profileImage.heightAnchor.constraint(equalToConstant: 64),
            
            cameraButton.widthAnchor.constraint(equalToConstant: 40),
            cameraButton.heightAnchor.constraint(equalToConstant: 40),
            
            writeButton.widthAnchor.constraint(equalToConstant: 40),
            writeButton.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            buttonStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class UpdateCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        textLabel?.text = "No recent updates to show right now."
        textLabel?.textColor = .secondaryLabel
        textLabel?.font = .preferredFont(forTextStyle: .subheadline)
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel?.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        textLabel?.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
