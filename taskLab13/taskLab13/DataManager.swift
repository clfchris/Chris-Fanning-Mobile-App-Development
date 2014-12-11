//
//  DataManager.swift
//  taskLab13
//
//  Created by Chris on 11/20/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import Foundation

class DataManager {
    var path = []
    
    func docFilePath(filename: String)->String? {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let dir = paths[0] as String
        return dir.stringByAppendingPathComponent(filename)
    }
}