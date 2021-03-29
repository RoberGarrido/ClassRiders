//
//  Character.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation

struct CharacterElement: Codable {
    var charID: Int?
    var name: String?
    var birthday: Birthday?
    var img: String?
    var status: Status?
    var nickname: String?
    var portrayed: String?
 
}

enum Birthday: String, Codable {
    case the07081993 = "07-08-1993"
    case the08111970 = "08-11-1970"
    case the09071958 = "09-07-1958"
    case the09241984 = "09-24-1984"
    case unknown = "Unknown"
}


enum Status: String, Codable {
    case alive = "Alive"
    case deceased = "Deceased"
    case presumedDead = "Presumed dead"
    case unknown = "Unknown"
}

typealias itemCharacter = [CharacterElement]




