//
//  DetailViewController.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    var userName: String = ""
    private var viewModel = GitDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        bindViewModel()
        callAPI()
        
    }
    
    private func createView() {
        self.view = .createView(GitDetailVIew.self)
        (self.view as? GitDetailVIew)?.delegate = self
    }
    
    private func bindViewModel() {
        viewModel.requestFailed = { [weak self] in
//            self?.presentFailView()
        }

        viewModel.requestSuccess = { [weak self] in
            guard let self = self else { return }
            self.reloadData()
        }
    }
    
    private func callAPI() {
        viewModel.getExampleData(userName)
    }
    
    private func reloadData() {
        let data = viewModel.getData()
        (self.view as? GitDetailVIew)?.configure(with: data.avatarUrl, loginName: data.loginName, name: data.name ?? "", location: data.location, isAdmin: data.isSiteAdmin, bio: data.bio, blog: data.blog)
    }
}


// MARK: - UITextViewDelegate
extension DetailViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:], completionHandler: nil)
        return false
    }
}
