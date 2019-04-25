//
//  Observable+Ext.swift
//  RxRepository
//
//  Created By Mateus on 24/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation
import RxSwift

extension Observable where Element: Sequence, Element.Iterator.Element: DomainConvertibleType {
    typealias DomainType = Element.Iterator.Element.DomainType

    func mapToDomain() -> Observable<[DomainType]> {
        return map { $0.mapToDomain() }
    }
}

extension Sequence where Iterator.Element: DomainConvertibleType {
    typealias Element = Iterator.Element

    func mapToDomain() -> [Element.DomainType] {
        return map { $0.asDomain() }
    }
}
