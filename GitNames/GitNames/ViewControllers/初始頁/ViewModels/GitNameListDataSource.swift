//
//  GitNameListDataSource.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit
import Alamofire

protocol GitNamesDataSource {
    func fetchData(successCompletion successHandler: @escaping ([GitNameModel]) -> Void, failureHandler:  @escaping () -> Void)
}

class GitNameListDataSource:  NSObject, GitNamesDataSource  {
    func fetchData(successCompletion successHandler: @escaping ([GitNameModel]) -> Void, failureHandler: @escaping () -> Void) {
        let url = "https://api.github.com/users"
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let responseData = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) else {
                    failureHandler()
                    return
                }
                guard let model = try? JSONDecoder().decode([GitNameModel].self, from: responseData) else {
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
