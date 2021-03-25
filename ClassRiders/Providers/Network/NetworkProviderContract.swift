//
//  NetworkProviderContract.swift
//  ClassRiders
//
//  Created by Rober Garrido on 25/3/21.
//

import Foundation
import PromiseKit

protocol CharacterProviderContract {
    func getAllCharacters() -> Promise<[BreakingBadDAO]>
}
