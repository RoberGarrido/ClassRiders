//
//  BreakingBadDAO.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation
import ObjectMapper

struct BreakingBadDAO: ImmutableMappable {

    static let defaultFront = "front_default"

    let char_id: Int
    let name: String
    let birthday: String
    let img: String
    let status: String
    let nickname: String
    let portrayed: String

    init(map: Map) throws {
        char_id = try map.value("id")
        name = try map.value("name")
        birthday = try map.value("birthday")
        img = try map.value("portrait")
        status = try map.value("status")
        nickname = try map.value("nickname")
        portrayed = try map.value("portrayed")
    }

    func mapping(map: Map) {
        char_id   >>> map["id"]
        name >>> map["name"]
        birthday >>> map["birthday"]
        img >>> map["portrait"]
        status >>> map["status"]
        nickname >>> map["nickname"]
        portrayed >>> map["portrayed"]
    }
}
