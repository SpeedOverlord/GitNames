//
//  GitDetailVIew.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit

//protocol GitDetailConfigure: AnyObject {
//    func configure(with avatarUrl: String?, name: String, isAdmin: Bool)
//}

class GitDetailVIew: UIView {
    
    weak var delegate: UITextViewDelegate?
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        return imageView
    }()
    
    private lazy var loginName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var separatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var location: UILabel = {
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
    
    private lazy var bio: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private lazy var blogStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .top
        return stack
    }()
    
    private lazy var blogTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        label.text = "Blog連結："
        return label
    }()
    
    private lazy var blog: UITextView = {
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 12)
        field.isEditable = false
        field.delegate = delegate
        return field
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configView()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        self.configView()
    }
    
    private func configView() {
        self.backgroundColor = .white
        self.addSubview(avatar)
        self.addSubview(loginName)
        self.addSubview(userName)
        self.addSubview(separatorLine)
        self.addSubview(location)
        self.addSubview(siteAdminStack)
        siteAdminStack.addArrangedSubview(siteAdminTitle)
        siteAdminStack.addArrangedSubview(siteAdminBadge)
        
        self.addSubview(bio)
        
        self.addSubview(blogStack)
        blogStack.addArrangedSubview(blogTitle)
        blogStack.addArrangedSubview(blog)
        
        layoutView()
    }
    
    private func layoutView() {
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            avatar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 120),
            avatar.heightAnchor.constraint(equalToConstant: 120),
            
            loginName.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20),
            loginName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginName.widthAnchor.constraint(equalToConstant: 120),
            
            userName.topAnchor.constraint(equalTo: loginName.bottomAnchor, constant: 20),
            userName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userName.widthAnchor.constraint(equalToConstant: 300),
            
            separatorLine.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            separatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 2),
            
            location.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 35),
            location.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            location.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            siteAdminStack.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 10),
            siteAdminStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            siteAdminStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            siteAdminStack.heightAnchor.constraint(equalToConstant: 30),
            
            bio.topAnchor.constraint(equalTo: siteAdminStack.bottomAnchor, constant: 10),
            bio.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            bio.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
          
            blogStack.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 10),
            blogStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            blogStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            blogStack.heightAnchor.constraint(equalToConstant: 100),
            
            blogTitle.widthAnchor.constraint(equalToConstant: 60),
            
            blog.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}


extension GitDetailVIew {
    func configure(with avatarUrl: String?, loginName: String, name: String, location: String?, isAdmin: Bool, bio: String?, blog: String?) {
        self.loginName.text = "暱稱： \(loginName)"
        self.userName.text = "使用者名稱： \(name)"
        if let url = avatarUrl {
            self.avatar.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: ""))
        } else {
            self.avatar.image = UIImage(named: "")
        }
        
        self.location.text = "地區： \(location ?? "無")"
        self.bio.text = "Bio：\(bio ?? "無")"
        if let blog = blog {
            let attributedString = NSMutableAttributedString(string: blog)
            attributedString.addAttribute(.link, value: blog, range: NSRange(location: 0, length: blog.count))
            
            
            self.blog.attributedText = attributedString
        } else {
            self.blog.text = "無"
        }
       
    }
}
