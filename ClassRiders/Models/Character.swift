//
//  Character.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation

struct Character {
    var char_id: Int
    var imgPortrait: String
    var name: String
    //var fav: Bool = false
    var birthday: String
    var status: String
    var nickname: String
    var portrayed: String
   

    init(breakingBadDAO: BreakingBadDAO) {
        char_id = breakingBadDAO.char_id
        name = breakingBadDAO.name
        imgPortrait = breakingBadDAO.img
        birthday = breakingBadDAO.birthday
        status = breakingBadDAO.status
        nickname = breakingBadDAO.nickname
        portrayed = breakingBadDAO.portrayed
        
    }
}
