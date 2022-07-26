//
//  GitNameListDataSource.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit
import Alamofire

protocol GitDetailDataSourceDelegate {
    func fetchData(_ withName: String, successCompletion successHandler: @escaping (GitDetailModel) -> Void, failureHandler:  @escaping () -> Void)
}

class GitDetailDataSource:  NSObject, GitDetailDataSourceDelegate  {
    func fetchData(_ withName: String, successCompletion successHandler: @escaping (GitDetailModel) -> Void, failureHandler: @escaping () -> Void) {
        let url = "https://api.github.com/users/\(withName)"
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let responseData = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) else {
                    failureHandler()
                    return
                }
                guard let model = try? JSONDecoder().decode(GitDetailModel.self, from: responseData) else {
                    failureHandler()
                    return
                }
                successHandler(model)
            case .failure(let error):
                failureHandler()
            }
        }
    }
}
