//
//  RealmRepresentable.swift
//  RxRepository
//
//  Created By Mateus on 24/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: DomainConvertibleType

    var uid: String { get }
    func asRealm() -> RealmType
}
