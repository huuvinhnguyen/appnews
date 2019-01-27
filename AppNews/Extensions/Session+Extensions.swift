//
//  Session+Extensions.swift
//  AppNews
//
//  Created by Apple on 1/27/19.
//

import Foundation
import RxSwift
import APIKit

extension Session: ReactiveCompatible {}

extension Reactive where Base: Session {
    
    func response<T: Request>(_ request: T) -> Single<T.Response> {
        
        return Single.create { [weak base] observer in
            let task = base?.send(request) { result in
                switch result {
                case .success(let response):
                    observer(.success(response))
                case .failure(let error):
                    observer(.error(error))
                }
            }
            
            return Disposables.create {
                task?.cancel()
            }
            }.retryWhen { (errors: Observable<Error>) in
                return errors
        }
    }
}

