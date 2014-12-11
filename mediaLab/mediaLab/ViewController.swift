//
//  ViewController.swift
//  mediaLab
//
//  Created by Chris on 11/18/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit
import MobileCoreServices
import MediaPlayer

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var image: UIImage?
    //var videoURL : NSURL?
    @IBAction func actionButtonTapped(sender: UIBarButtonItem) {
        let actionSheet=UIAlertController(title: "Media Action", message: "What would you like to do with your media?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let roll=UIAlertAction(title: "Camera Roll", style: UIAlertActionStyle.Default, handler: { action in var imagePickerController=UIImagePickerController()
        imagePickerController.delegate=self
        imagePickerController.sourceType=UIImagePickerControllerSourceType.SavedPhotosAlbum
        imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.SavedPhotosAlbum)!
        self.presentViewController(imagePickerController, animated: true, completion: nil)})
        actionSheet.addAction(roll)
        let cancel=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        if(image != nil) {
            let save=UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: {action in UIImageWriteToSavedPhotosAlbum(self.image, self, Selector("image:didFinishSavingWithError:contextInfo:"), nil)})
            actionSheet.addAction(save)
        }
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cameraButtonTapped(sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            var imagePickerController=UIImagePickerController()
            imagePickerController.delegate=self
            imagePickerController.sourceType=UIImagePickerControllerSourceType.Camera
            imagePickerController.mediaTypes=[kUTTypeImage, kUTTypeMovie]
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
        else {
            println("Can't access the camera")
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as String
        if mediaType == kUTTypeImage{
            image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imageView.image=image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func image(image: AnyObject, didFinishSavingWithError error: NSError?, contextInfo: UnsafePointer<Void>){
        if let saveError=error{
            let errorAlert=UIAlertController(title: "Error", message: saveError.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            errorAlert.addAction(cancelAction)
            presentViewController(errorAlert, animated: true, completion: nil)
            
        }
        else {
            let successAlert=UIAlertController(title: "Success", message: "Successfully saved to camera roll", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            successAlert.addAction(okAction)
            presentViewController(successAlert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

