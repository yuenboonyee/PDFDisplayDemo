//
//  PDFViewController.swift
//  PDFDisplayDemo
//
//  Created by Yuen Boon Yee on 27/01/2016.
//  Copyright © 2016 Serene IT. All rights reserved.
//

import Foundation
import UIKit

class PDFViewController: UIViewController {
    @IBOutlet weak var uiWebView: UIWebView!
    @IBOutlet weak var uiActivityIndicator: UIActivityIndicatorView!
    var nsData:NSData = NSData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
//        let urlRequestPDF = NSURLRequest(URL: NSURL(string: "https://auspost.com.au/media/documents/domestic-parcels-guide-jan15.pdf")!)
//        self.uiWebView.loadRequest(urlRequestPDF)
        self.getNSDataForPDF()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Private methods
    /**
    Uses an NSURLSession to retrieve the PDF data. Updates the UIActivityIndicator when done. Sets the nsData property.
    */
    func getNSDataForPDF(){
        let nsURLSession = NSURLSession.sharedSession()
        let nsURL = NSURL(string: "https://auspost.com.au/media/documents/domestic-parcels-guide-jan15.pdf")
        //        let nsURL = NSURL(fileURLWithPath: "https://auspost.com.au/media/documents/domestic-parcels-guide-jan15.pdf")
        let nsURLRequest = NSURLRequest(URL: nsURL!)
        let nsURLSessionDataTask = nsURLSession.dataTaskWithRequest(nsURLRequest) { (nsData, nsURLResponse, nsError) -> Void in
            self.nsData = nsData!
            //Update UI in the main thread. Ref: http://stackoverflow.com/questions/28137380/updating-ui-from-background-thread-swift
            dispatch_async(dispatch_get_main_queue()) {
                // update some UI
                self.uiActivityIndicator.hidden = true
                self.uiWebView.loadData(nsData!, MIMEType: "application/pdf", textEncodingName: "utf-8", baseURL: NSURL())
            }
            
        }
        nsURLSessionDataTask.resume()
    }

    //MARK: Actions
    @IBAction func shareButton(sender: UIBarButtonItem) {
//        let textToShare = "Look at this awesome website for aspiring iOS Developers!"
//        let myWebsite = NSURL(string: "http://www.codingexplorer.com/")
//        let objectsToShare:[AnyObject] = [textToShare, myWebsite!]
        let objectsToShare:[AnyObject] = [nsData]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        
        activityViewController.excludedActivityTypes = [UIActivityTypeAssignToContact,
            UIActivityTypeCopyToPasteboard,
        UIActivityTypeSaveToCameraRoll,
        UIActivityTypeAddToReadingList,
        UIActivityTypePostToFlickr,
        UIActivityTypePostToVimeo];

        self.presentViewController(activityViewController, animated: true) { () -> Void in
            
        }
    }
    
    /*
    - (IBAction)shareButton:(UIBarButtonItem *)sender
    {
    NSString *textToShare = @"Look at this awesome website for aspiring iOS Developers!";
    NSURL *myWebsite = [NSURL URLWithString:@"http://www.codingexplorer.com/"];
    
    NSArray *objectsToShare = @[textToShare, myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
    UIActivityTypePrint,
    UIActivityTypeAssignToContact,
    UIActivityTypeSaveToCameraRoll,
    UIActivityTypeAddToReadingList,
    UIActivityTypePostToFlickr,
    UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];
    }
    */
}

