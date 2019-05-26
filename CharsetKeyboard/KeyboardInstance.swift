//
//  KeyboardInstance.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import Foundation

public class KeyboardInstance {
    let characters: [Character]
    let enabler = ButtonEnabler()
    
    private(set) lazy var keyboardView: KeyboardView = {
        let view = UINib(nibName: "Keyboard", bundle: Bundle(for: Swift.type(of: self)))
            .instantiate(withOwner: nil, options: nil).first! as! KeyboardView
        view.viewModel = viewModel
        return view
    }()
    private(set) lazy var viewModel = KeyboardViewModel(characters: characters, buttonEnabler: enabler)
    
    init(characters: [Character]) {
        self.characters = characters
    }
    
    public var view: UIView {
        return keyboardView
    }
    
    public var text: ValueProducer<String> {
        return viewModel.text
    }
    
    public func setPossibleInputs(_ inputs: [String]) {
        let position = viewModel.text.first()?.value?.count ?? 0
        enabler.update(with: inputs, on: position)
    }
}
