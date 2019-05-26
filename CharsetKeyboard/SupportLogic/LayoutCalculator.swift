//
//  LayoutCalculator.swift
//  Keyboard
//
//  Created by Vyacheslav Beltyukov on 10/9/18.
//  Copyright © 2018 Vyacheslav Beltyukov. All rights reserved.
//

import Foundation

class LayoutCalculator {
    var viewSize: CGSize = .zero
    var itemsCount: Int = 1
    
    private var itemsFloat: CGFloat {
        return CGFloat(itemsCount)
    }
    
    private var columns: CGFloat {
        return 5
    }
    
    private var rows: CGFloat {
        return ceil(itemsFloat/columns)
    }
    
    var spacing: CGFloat {
        return max((viewSize.width * 0.1) / (columns + 1), 8)
    }
    
    var itemSize: CGSize {
        return CGSize(width: portionSize(full: viewSize.width, count: columns),
                      height: portionSize(full: viewSize.height, count: rows))
    }
    
    private func portionSize(full: CGFloat, count: CGFloat) -> CGFloat {
        return (full - spacing * (count + 1)) / count
    }
}
