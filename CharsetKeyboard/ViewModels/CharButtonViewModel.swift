//
//  ButtonViewModel.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import Foundation
import ReactiveCocoa

class CharButtonViewModel: ButtonViewModel {
    let character: Character
    
    private let enabler: ButtonEnabler
    private let typePipe = ValueSignal<Character>.pipe()
    
    init(character: Character, enabler: ButtonEnabler) {
        self.character = character
        self.enabler = enabler
    }
    
    var title: String {
        return String(character).uppercased()
    }
    
    var isEnabled: ValueProducer<Bool> {
        return enabler.visibility(for: character)
    }
    
    var typeSymbols: ValueSignal<Character> {
        return typePipe.output
    }
    
    var cellIdentifier: String {
        return "Char"
    }
    
    func buttonTapped() {
        typePipe.input.send(value: character)
    }
}
