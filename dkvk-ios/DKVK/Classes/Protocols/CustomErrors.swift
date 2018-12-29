//
//  CustomErrors.swift
//  DKVK
//
//  Created by Вячеслав Лойе on 29/12/2018.
//  Copyright © 2018 Hadevs. All rights reserved.
//

import UIKit

/// better use own that alamofire one
enum Result<Value> {
    case success(Value)
    case failure(Error)
}

/// can be created ApiErrors and etc.
enum CustomErrors {
    case invalidEmail
    case unknownError
    case serverError
}

extension CustomErrors: LocalizedError {
    /// can be created extension for String
    /// errorDescription is used in Error.localizedDescription
    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString("email_is_not_valid", comment: "")
        case .unknownError:
            /// we will use server_error key to display user internal error
            return NSLocalizedString("server_error", comment: "")
        case .serverError:
            return NSLocalizedString("server_error", comment: "")
        }
    }
}


