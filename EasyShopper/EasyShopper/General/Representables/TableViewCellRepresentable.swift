//
//  TableViewCellRepresentable.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
import UIKit

/// Table View Cell Representable
protocol TableViewCellRepresentable {
    
    /// Cell Height
    var cellHeight: CGFloat { get set }
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String { get set }
    
}
