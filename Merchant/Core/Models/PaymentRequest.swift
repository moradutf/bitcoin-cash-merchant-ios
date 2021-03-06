//
//  PaymentRequest.swift
//  Merchant
//
//  Created by Jean-Baptiste Dominguez on 2019/04/23.
//  Copyright © 2019 Bitcoin.com. All rights reserved.
//

import Foundation

struct PaymentRequest {
    var toAddress: String
    var amountInSatoshis: Int64
    var amountInFiat: String
    var selectedCurrency: StoreCurrency
}
