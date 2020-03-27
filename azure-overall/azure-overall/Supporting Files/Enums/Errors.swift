//
//  AppError.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

enum AppError: Error {
    case networkingNoDataReceived
    case networkingBadStatusCode
    case networkingNoInternetConnection
    case other(rawError: Error)
}
