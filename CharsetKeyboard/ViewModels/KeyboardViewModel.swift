//
//  KeyboardViewModel.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import Foundation
import ReactiveSwift

class KeyboardViewModel {
    let viewModels: [CharButtonViewModel]
    
    private let textInternal = MutableProperty("")
    private lazy var deleteViewModel = DeleteButtonViewModel(text: textInternal)
    
    init(characters: [Character], buttonEnabler: ButtonEnabler) {
        self.viewModels = characters.map { CharButtonViewModel(character: $0, enabler: buttonEnabler) }
        subscribeToCharViewModels()
    }
    
    var text: ValueProducer<String> {
        return textInternal.producer
    }
    
    func cellCount() -> Int {
        return viewModels.count + 1
    }
    
    func cellViewModel(at index: Int) -> ButtonViewModel {
        if viewModels.count > index {
            return viewModels[index]
        } else {
            return deleteViewModel
        }
    }
    
    private func subscribeToCharViewModels() {
        viewModels.forEach {
            $0.typeSymbols.observeValues { [weak self] in
                self?.textInternal.value.append($0)
            }
        }
    }
}
