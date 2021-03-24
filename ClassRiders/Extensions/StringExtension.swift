//
//  StringExtension.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation
import LanguageManager_iOS

extension String {
    /// Localizable strings
    ///
    /// - Returns: a string form localizable files
    func localizedString() -> String {
        let bundle = Bundle.main.path(forResource: LanguageManager.shared.currentLanguage.rawValue,
                                      ofType: "lproj") ?? ""
        return NSLocalizedString(self,
                                 tableName: nil,
                                 bundle: Bundle(path: bundle) ?? Bundle.main,
                                 value: "",
                                 comment: "localizable string: \(self)")
    }
}
