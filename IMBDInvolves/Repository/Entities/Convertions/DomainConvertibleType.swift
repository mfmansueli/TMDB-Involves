//
//  DomainConvertibleType.swift
//  RxRepository
//
//  Created By Mateus on 24/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

protocol DomainConvertibleType {
    associatedtype DomainType

    func asDomain() -> DomainType
}
