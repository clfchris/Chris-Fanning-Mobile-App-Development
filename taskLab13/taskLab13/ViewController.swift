//
//  ViewController.swift
//  taskLab13
//
//  Created by Chris Fanning on 12/11/14.
//  Copyright (c) 2014 Chris Fanning. All rights reserved.
//  Built on iPad for proper testing

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var task1: UITextField!
    @IBOutlet weak var task2: UITextField!
    @IBOutlet weak var task3: UITextField!
    @IBOutlet weak var task4: UITextField!
    
    let kFileName = "data.plist"
    var dataFilePath=DataManager()
    var taskArchive = Task()
    
    override func viewDidLoad() {
        task1.delegate=self
        task2.delegate=self
        task3.delegate=self
        task4.delegate=self
        let filepath = dataFilePath.docFilePath(kFileName)
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(filepath!) {
            let data = NSData(contentsOfFile: filepath!)
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
            taskArchive = unarchiver.decodeObjectForKey("Data") as Task
            unarchiver.finishDecoding()
            task1.text=taskArchive.tasks[0] as String
            task2.text=taskArchive.tasks[1] as String
            task3.text=taskArchive.tasks[2] as String
            task4.text=taskArchive.tasks[3] as String
        }
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: "UIApplicationWillResignActiveNotification", object: app)
        super.viewDidLoad()
    }
    
    func applicationWillResignActive(notification: NSNotification){
        let filepath = dataFilePath.docFilePath(kFileName)
        taskArchive.tasks[0]=task1.text
        taskArchive.tasks[1]=task2.text
        taskArchive.tasks[2]=task3.text
        taskArchive.tasks[3]=task4.text
        var data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(taskArchive, forKey: "Data")
        archiver.finishEncoding()
        data.writeToFile(filepath!, atomically: true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
