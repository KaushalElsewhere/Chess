//
//  CGSize+.swift
//  Chess
//
//  Created by Kaushal on 24/6/2022.
//

import Foundation
import UIKit

func +(lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}
