//
//  Observable.swift
//  ArtigosAPP
//
//  Created by Ezequias Santos on 30/11/22.
//

import Foundation

public final class Observable<T> {
    public typealias Listener = (T) -> Void
    public var listener: Listener?

    public func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

    public var value: T {
        didSet {
            listener?(value)
        }
    }

    public init(_ object: T) {
        value = object
    }
}
