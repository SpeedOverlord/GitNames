//
//  GitNameListVIew.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit

class GitNameListVIew: UIView {
    lazy var mainTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        return tableview
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
        self.addSubview(mainTableView)
        layoutView()
    }
    
    private func layoutView() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
