//
//  Typealiases.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 26/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import Foundation

typealias StaticCellProtocol = NibLoadable & HeightContainable
typealias ItemClosure<T> = ((T) -> Void)
typealias OptionalItemClosure<T> = ((T?) -> Void)
typealias VoidClosure = (() -> Void)
typealias ResultHandler<Value> = (Result<Value>) -> Void
