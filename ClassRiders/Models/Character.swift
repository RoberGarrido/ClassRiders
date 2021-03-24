//
//  Character.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation

struct Character {
    var imgPortrait: String
    var name: String
    //var fav: Bool = false
    var status: String
    var nickname: String
    //var types: [String]

    init(breakingBadDAO: BreakingBadDAO) {
        name = breakingBadDAO.name
        if !breakingBadDAO.img.isEmpty,
           let defaultFront = breakingBadDAO.img[BreakingBadDAO.defaultFront] as? String {
            imgPortrait = defaultFront
        } else {
            imgPortrait = ""
        }
        status = breakingBadDAO.status
        nickname = breakingBadDAO.nickname
        //let typesString = pokemonDAO.types.map { element -> String? in
          //  if let type = element["type"] as? [String: String],
            //   let nameType = type["name"] {
              //  return nameType
            //} else {
              //  return nil
            //}
        //}

        //types = typesString.compactMap { $0 }
    }
}
