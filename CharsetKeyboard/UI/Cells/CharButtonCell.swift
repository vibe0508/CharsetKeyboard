//
//  ButtonCell.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class CharButtonCell: ButtonCell {
    
    private var viewModel: CharButtonViewModel? {
        didSet { subscribeToViewModel() }
    }
    
    override func setViewModel(_ viewModel: ButtonViewModel) {
        super.setViewModel(viewModel)
        self.viewModel = viewModel as? CharButtonViewModel
    }
    
    private func subscribeToViewModel() {
        var disposables: [Disposable?] = []
        defer {
            vmSubscription = CompositeDisposable(disposables.compactMap { $0 })
        }
        
        button.setTitle(viewModel?.title, for: .normal)
        
        guard let viewModel = viewModel else { return }
        
        disposables.append(button.reactive.isEnabled <~ viewModel.isEnabled)
        disposables.append(button.reactive.backgroundColor <~ viewModel.isEnabled.map{ $0 ? .white : .lightGray })
    }
}
