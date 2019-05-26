//
//  ButtonEnabler.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import Foundation
import ReactiveSwift

class ButtonEnabler {
    private let charset = MutableProperty<Set<Character>>([])
    
    func update(with possibleValues: [String], on cursorPosition: Int) {
        charset.value = Set(possibleValues.compactMap {
            guard $0.count > cursorPosition else {
                return nil
            }
            let index = $0.index($0.startIndex, offsetBy: cursorPosition)
            return $0[index]
        })
    }
    
    func visibility(for character: Character) -> ValueProducer<Bool> {
        return charset.producer.map {
            $0.contains(character)
        }
    }
}
