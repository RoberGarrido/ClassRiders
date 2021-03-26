//
//  NetworkConstants.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation

let kAPIProdURL: String = "https://production.com:3000/api/v1/"
let kAPIDevURL: String = "http://127.0.0.1:7000/api/v1/"
let kApiProduction: Bool = Environment.appEnv == "Production"
let kAPIURL: String = kApiProduction ? kAPIProdURL : kAPIDevURL

let kLoginToken: String = "WRR=W-Lqu82Tq8B$Kg7t@W-unzhC-&@bV-u^"

let kTimeoutIntervalForRequest = Double(10)
let kTimeoutIntervalForResource = Double(10)

class NetworkConstants {
    
    static let baseUrl: String = "https://www.breakingbadapi.com/api/"
    static let paramCharacters: String = "characters/"
    
}

