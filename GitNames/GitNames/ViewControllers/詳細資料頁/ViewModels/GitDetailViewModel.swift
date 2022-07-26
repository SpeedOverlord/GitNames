//
//  GitDetailViewModel.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import Foundation
//
//  GitNameListViewModel.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit

class GitDetailViewModel: NSObject {
    
    
    var requestSuccess: (() ->Void)?
    var requestFailed: (() ->Void)?
    private var resultModel: GitDetailModel?
    private let dataSource = GitDetailDataSource()
    
    func getExampleData(_ withName: String) {
        dataSource.fetchData(withName) { [weak self] (model) in
            self?.resultModel = model
            self?.requestSuccess?()
        } failureHandler: { [weak self]  in
            self?.requestFailed?()
        }
    }
    
    func getData() -> GitDetailModel {
        return resultModel!
    }

}
