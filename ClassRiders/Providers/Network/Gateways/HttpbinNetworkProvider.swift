//
//  HttpbinNetworkProvider.swift
//  ClassRiders
//
//  Created by Rober Garrido on 29/3/21.
//

import Foundation
import Alamofire
import PromiseKit

typealias LoginProviderContract = HttpbinNetworkProviderContract

protocol HttpbinNetworkProviderContract {
    func sendFormData(formData: [String: String]) -> Promise<Void>
}

class HttpbinNetworkProvider: HttpbinNetworkProviderContract {
    func sendFormData(formData: [String: String]) -> Promise<Void> {
        return Promise<Void> { promise in
            promise.fulfill(())
        }
    }
}
