//
//  ArrayExtension.swift
//  ClassRiders
//
//  Created by Rober Garrido on 29/3/21.
//

import Foundation

extension Array {
    
    /// forEach function that allows mutate the items
    ///
    /// - Example:
    ///     array.mutateEach(by: { item in
    ///         item.property = newValue
    ///     })
    ///
    mutating func mutateEach(by transform: (inout Element) throws -> Void) rethrows {
       self = try map { element in
           var element = element
           try transform(&element)
           return element
       }
    }
}
