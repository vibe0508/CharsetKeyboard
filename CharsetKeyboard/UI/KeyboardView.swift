//
//  Keyboard.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import UIKit

class KeyboardView: UIView {
    let layoutCalculator = LayoutCalculator()
    var viewModel: KeyboardViewModel! {
        didSet {
            layoutCalculator.itemsCount = viewModel.cellCount()
        }
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "DeleteButtonCell", bundle: Bundle(for: Swift.type(of: self))),
                                forCellWithReuseIdentifier: "Delete")
        collectionView.register(UINib(nibName: "CharButtonCell", bundle: Bundle(for: Swift.type(of: self))),
                                forCellWithReuseIdentifier: "Char")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutCalculator.viewSize = collectionView?.frame.size ?? .zero
        collectionView?.flowLayout?.minimumLineSpacing = layoutCalculator.spacing
        collectionView?.flowLayout?.minimumInteritemSpacing = layoutCalculator.spacing
        collectionView.flowLayout?.sectionInset = UIEdgeInsets(value: layoutCalculator.spacing)
//        collectionView.semanticContentAttribute = .forceRightToLeft
    }
}

extension KeyboardView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let buttonViewModel = viewModel.cellViewModel(at: indexPath.item)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: buttonViewModel.cellIdentifier,
                                                      for: indexPath)
        (cell as? ButtonCell)?.setViewModel(buttonViewModel)
        return cell
    }
}

extension KeyboardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return layoutCalculator.itemSize
    }
}
