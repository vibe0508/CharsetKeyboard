//
//  Keyboard.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import Foundation

public class Keyboard {
    public let characters: [Character]
    
    public init(characters: [Character]) {
        self.characters = characters
    }
    
    public func makeInstance() -> KeyboardInstance {
        return KeyboardInstance(characters: characters)
    }
}
