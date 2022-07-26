//
//  GitNameListViewModel.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit

class GitNameListViewModel: NSObject {
    
    var requestSuccess: (() ->Void)?
    var requestFailed: (() ->Void)?
    private var resultModel: [GitNameModel]?
    private let dataSource = GitNameListDataSource()
    
    func getExampleData() {
        dataSource.fetchData { [weak self] (model) in
            self?.resultModel = model
            self?.requestSuccess?()
        } failureHandler: { [weak self]  in
            self?.requestFailed?()
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        guard let model = self.resultModel else {
            return 0
        }
        return model.count
    }
    
    func cellForRow(indexPath: IndexPath) -> GitNameModel {
        let row = indexPath.row
        return self.resultModel![row]
    }

}
