//
//  task.swift
//  taskLab13
//
//  Created by Chris on 11/20/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import Foundation

class task : NSObject, NSCoding{
    var tasks = NSMutableArray()
    
    override init() {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(tasks[0], forKey: "Item1")
        aCoder.encodeObject(tasks[1], forKey: "Item2")
        aCoder.encodeObject(tasks[2], forKey: "Item3")
        aCoder.encodeObject(tasks[3], forKey: "Item4")
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        tasks[0] = aDecoder.decodeObjectForKey("Task1") as String
        tasks[1] = aDecoder.decodeObjectForKey("Task2") as String
        tasks[2] = aDecoder.decodeObjectForKey("Task3") as String
        tasks[3] = aDecoder.decodeObjectForKey("Task4") as String
    }
}