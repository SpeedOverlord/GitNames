//
//  ViewController.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit

class RootViewController: UIViewController {

    private var viewModel = GitNameListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        createView()
        regisCell()
        bindViewModel()
        callAPI()
    }
    
    private func setView() {
        self.title = "使用者"
    }

    private func createView() {
        self.view = .createView(GitNameListVIew.self)
        (self.view as? GitNameListVIew)?.mainTableView.delegate = self
        (self.view as? GitNameListVIew)?.mainTableView.dataSource = self
    }
    
    private func regisCell() {
        (self.view as? GitNameListVIew)?.mainTableView.register(GitNameListTableVIewCell.self, forCellReuseIdentifier: "GitNameListTableVIewCell")
    }
    
    private func bindViewModel() {
        viewModel.requestFailed = { [weak self] in
//            self?.presentFailView()
        }

        viewModel.requestSuccess = { [weak self] in
            guard let self = self else { return }
            (self.view as? GitNameListVIew)?.mainTableView.reloadData()
        }
    }
    
    private func callAPI() {
        viewModel.getExampleData()
    }


}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = viewModel.cellForRow(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "GitNameListTableVIewCell", for: indexPath) as! GitNameListTableVIewCell
        cell.configure(with: data.loginName, avatarUrl: data.avatarUrl, isAdmin: data.isSiteAdmin)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        let data = viewModel.cellForRow(indexPath: indexPath)
        vc.userName = data.loginName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
