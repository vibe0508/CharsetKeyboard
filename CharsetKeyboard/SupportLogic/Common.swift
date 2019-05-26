//
//  Common.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import Result
import Foundation
import ReactiveSwift

public typealias ValueProducer<T> = SignalProducer<T, NoError>
public typealias ValueSignal<T> = Signal<T, NoError>

extension UICollectionView {
    var flowLayout: UICollectionViewFlowLayout? {
        return collectionViewLayout as? UICollectionViewFlowLayout
    }
}

extension UIEdgeInsets {
    init(value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
}
