//
//  TransactionsBuilder.swift
//  Merchant
//
//  Created by Jean-Baptiste Dominguez on 2018/11/04.
//  Copyright © 2018 Bitcoin.com. All rights reserved.
//

import UIKit
import BDCKit

class TransactionsBuilder: BDCBuilder {
    
    func provide() -> UIViewController {
        let viewController = TransactionsViewController()
        
        let getTransactionsInteractor = GetTransactionsInteractor()
        let presenter = TransactionsPresenter()
        
        presenter.getTransactionsInteractor = getTransactionsInteractor
        presenter.viewDelegate = viewController
        
        viewController.presenter = presenter
        
        presenter.viewDidLoad()
        
        return viewController
    }
}
