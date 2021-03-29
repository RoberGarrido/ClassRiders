//
//  BaseNetworkProvider.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation
import Alamofire

// MARK: - Enums

/// Available API endpoints
enum APIEndpoint: String, CodingKey {
    case charID = "char_id"
    case name, birthday, img, status, nickname, appearance, portrayed
}

/// Network errors
enum NetworkError: Error, LocalizedError {
    case generic(String)
    case badResponse
    case badData

    /// Localized description
    var localizedDescription: String {
        switch self {
        case .generic(let localizableDescription):
            return localizableDescription
        case .badResponse:
            return "network_error_parsing_description".localizedString()
        case .badData:
            return "network_error_bad_data".localizedString()
        }
    }
}

// MARK: - Class
class BaseNetworkProvider {
    /// Main session manager
    var sessionManager: Session = {
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustEvaluating] = [
            kAPIURL: PinnedCertificatesTrustEvaluator(certificates: [],
                                                      acceptSelfSignedCertificates: false,
                                                      performDefaultValidation: true,
                                                      validateHost: true),
            "selfsignedserver.com": DisabledTrustEvaluator()
        ]

        // Create custom manager
        var configuration = URLSessionConfiguration.af.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = kTimeoutIntervalForRequest
        configuration.timeoutIntervalForResource = kTimeoutIntervalForResource
        configuration.httpMaximumConnectionsPerHost = 2

        let manager = ServerTrustManager(evaluators: serverTrustPolicies)
        let session = Session(configuration: configuration)

        return session
    }()
}
