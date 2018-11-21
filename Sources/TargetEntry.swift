//
//  TargetEntry.swift
//  SwiftGtk
//
//  Created by Rene Hexel on 25/4/17.
//  Copyright © 2017, 2018s Rene Hexel.  All rights reserved.
//
import CGtk
import Foundation

public extension GtkTargetEntry {
    /// Drag and drop target entry convenience constructor
    ///
    /// - Parameters:
    ///   - target: name of the target
    ///   - flags: target restrictions (defaults to `.same_app`)
    ///   - info: target information
    public init(target: String, flags: TargetFlags = .same_app, info: Int = 0) {
        self.init()
        self.target = strdup(target)
        self.flags = flags.rawValue
        self.info = guint(info)
    }
}
