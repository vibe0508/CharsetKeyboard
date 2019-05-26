//
//  DeleteButtonViewModel.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/10/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import Foundation
import ReactiveSwift

class DeleteButtonViewModel: ButtonViewModel {
    let cellIdentifier = "Delete"
    let text: MutableProperty<String>
    
    init(text: MutableProperty<String>) {
        self.text = text
    }
    
    func buttonTapped() {
        guard !text.value.isEmpty else { return }
        _ = text.value.removeLast()
    }
}
