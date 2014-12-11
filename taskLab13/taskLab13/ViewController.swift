//
//  ViewController.swift
//  taskLab13
//
//  Created by Chris on 11/20/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let kFilename = "archive"
    var dataFilePath=DataManager()
    var taskArchive = task()
    
    @IBOutlet weak var item1: UITextField!
    @IBOutlet weak var item2: UITextField!
    @IBOutlet weak var item3: UITextField!
    @IBOutlet weak var item4: UITextField!
    override func viewDidLoad() {
        let filepath = dataFilePath.docFilePath(kFilename)
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(filepath!) {
            //taskList.tasks=NSMutableArray(contentsOfFile: filepath!)!
            let data = NSData(contentsOfFile: filepath!)
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
            taskArchive = unarchiver.decodeObjectForKey("Data") as task
            unarchiver.finishDecoding()
            item1.text=taskArchive.tasks.objectAtIndex(0) as String
            item2.text=taskArchive.tasks.objectAtIndex(1) as String
            item3.text=taskArchive.tasks.objectAtIndex(2) as String
            item4.text=taskArchive.tasks.objectAtIndex(3) as String
        }
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: "UIApplicationWillResignActiveNotification", object: app)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func applicationWillResignActive(notification: NSNotification){
        let filepath = dataFilePath.docFilePath(kFilename)
        taskArchive.tasks[0]=item1.text
        taskArchive.tasks[1]=item2.text
        taskArchive.tasks[2]=item3.text
        taskArchive.tasks[3]=item4.text
        var data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(taskArchive, forKey: "Data")
        archiver.finishEncoding()
        data.writeToFile(filepath!, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

