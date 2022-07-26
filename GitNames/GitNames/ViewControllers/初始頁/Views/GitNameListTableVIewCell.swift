//
//  GitNameListTableVIewCell.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit
import SDWebImage

protocol GitNamesConfigure: AnyObject {
    func configure(with name: String, avatarUrl: String?, isAdmin: Bool)
}

class GitNameListTableVIewCell: UITableViewCell {
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private lazy var siteAdminStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    private lazy var siteAdminTitle: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.text = "是否為Admin："
        return label
    }()
    
    private lazy var siteAdminBadge: UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private func layoutView() {
        self.addSubview(avatar)
        self.addSubview(userName)
        self.addSubview(siteAdminStack)
        
        siteAdminStack.addArrangedSubview(siteAdminTitle)
        siteAdminStack.addArrangedSubview(siteAdminBadge)
    }
    
    private func configureView() {
        NSLayoutConstraint.activate([
            
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            avatar.heightAnchor.constraint(equalToConstant: 50),
            avatar.widthAnchor.constraint(equalToConstant: 50),
            avatar.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            userName.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            userName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            userName.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            siteAdminStack.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 10),
            siteAdminStack.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            siteAdminStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            siteAdminStack.heightAnchor.constraint(equalToConstant: 25),
            siteAdminStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            siteAdminBadge.widthAnchor.constraint(equalToConstant: 20),
            siteAdminBadge.heightAnchor.constraint(equalToConstant: 20),
        ])

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension GitNameListTableVIewCell: GitNamesConfigure {
    func configure(with name: String, avatarUrl: String?, isAdmin: Bool) {
        layoutView()
        configureView()
        userName.text = "使用者名稱：\(name)"
        if let url = avatarUrl {
            avatar.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: ""))
        } else {
            avatar.image = UIImage(named: "")
        }
    }
}
