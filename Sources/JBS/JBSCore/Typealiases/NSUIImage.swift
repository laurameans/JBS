//
//  File.swift
//  
//
//  Created by Justin Means on 1/9/22.
//

#if !os(Linux)
import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif

#if canImport(UIKit)
public typealias NSUIImage = UIImage
#else
public typealias NSUIImage = NSImage
#endif
#endif
