//
//  SettingViewController.swift
//  WhatsappClone
//
//  Created by Windy on 25/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 4
        case 3:
            return 2
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return MyProfileCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.accessoryType = .disclosureIndicator
            switch indexPath.row {
            case 0:
                cell.imageView?.image = UIImage(systemName: "star")
                cell.textLabel?.text = "Starred Messages"
            default:
                cell.imageView?.image = UIImage(systemName: "wifi")
                cell.textLabel?.text = "Whatsapp Web / Desktop"
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.accessoryType = .disclosureIndicator
            switch indexPath.row {
            case 0:
                cell.imageView?.image = UIImage(systemName: "person")
                cell.textLabel?.text = "Account"
            case 1:
                cell.imageView?.image = UIImage(systemName: "bubble.right")
                cell.textLabel?.text = "Chats"
            case 2:
                cell.imageView?.image = UIImage(systemName: "bell")
                cell.textLabel?.text = "Notifications"
            default:
                cell.imageView?.image = UIImage(systemName: "globe")
                cell.textLabel?.text = "Data and Storage Usage"
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.accessoryType = .disclosureIndicator
            switch indexPath.row {
            case 0:
                cell.imageView?.image = UIImage(systemName: "info")
                cell.textLabel?.text = "Help"
            default:
                cell.imageView?.image = UIImage(systemName: "heart")
                cell.textLabel?.text = "Tell a Friend"
            }
            return cell
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

class MyProfileCell: UITableViewCell {
    
    let profileImage = UIImageView()
    let myStatusLabel = UILabel()
    let descriptionLabel = UILabel()
    let qrCodeButton = UIButton()
    
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
        
        qrCodeButton.setBackgroundImage(UIImage(systemName: "qrcode"), for: .normal)
        qrCodeButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(qrCodeButton)
        
        let stackView = UIStackView(arrangedSubviews: [profileImage, labelStackView])
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 64),
            profileImage.heightAnchor.constraint(equalToConstant: 64),
            
            qrCodeButton.widthAnchor.constraint(equalToConstant: 40),
            qrCodeButton.heightAnchor.constraint(equalToConstant: 40),
            qrCodeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            qrCodeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
