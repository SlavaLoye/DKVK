//
//  Extensions+Encodable.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 02/01/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

