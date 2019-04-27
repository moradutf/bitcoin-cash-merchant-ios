//
//  PaymentRequestPresenter.swift
//  Merchant
//
//  Created by Jean-Baptiste Dominguez on 2019/04/23.
//  Copyright © 2019 Bitcoin.com. All rights reserved.
//

import Foundation
import RxSwift

class PaymentRequestPresenter {
    
    var waitTransactionInteractor: WaitTransactionInteractor?
    var router: PaymentRequestRouter?
    
    weak var viewDelegate: PaymentRequestViewController?
    
    fileprivate let bag = DisposeBag()
    fileprivate var pr: PaymentRequest
    fileprivate var txDisp: Disposable?
    
    init(_ pr: PaymentRequest) {
        self.pr = pr
    }
    
    func viewDidLoad() {
        let data = "\(pr.toAddress)?amount=\(pr.amountInSatoshis.toBCH())"
        viewDelegate?.onSetQRCode(withData: data)
        viewDelegate?.onSetAmount(pr.amountInFiat, bchAmount: pr.amountInSatoshis.toBCH().description.toFormat("BCH", symbol: "BCH"))
        
        txDisp = waitTransactionInteractor?
            .waitTransaction(withPr: pr)
            .subscribe(onSuccess: { isSuccess in
                self.viewDelegate?.onSuccess()
            }, onError: { error in
                // Handle error
            })
        txDisp?.disposed(by: bag)
    }
    
    func viewDidDisappear() {
        txDisp?.dispose()
    }
    
    func didPushClose() {
        router?.transitBackTo()
    }
}