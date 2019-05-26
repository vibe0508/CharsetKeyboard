//
//  ButtonCell.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/10/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

protocol ButtonViewModel {
    func buttonTapped()
    var cellIdentifier: String { get }
}

class ButtonCell: UICollectionViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    var vmSubscription: CompositeDisposable? {
        didSet {
            oldValue?.dispose()
        }
    }
    
    private var viewModel: ButtonViewModel?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.layer.cornerRadius = frame.height * 0.2
    }
    
    func setViewModel(_ viewModel: ButtonViewModel) {
        self.viewModel = viewModel
    }
    
    @IBAction private func onButtonTapped() {
        viewModel?.buttonTapped()
    }
}
