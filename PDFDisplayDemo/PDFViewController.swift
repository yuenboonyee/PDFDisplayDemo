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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
//        let urlRequest = NSURLRequest(URL: NSURL(string: "https://www.google.com")!)
        let urlRequestPDF = NSURLRequest(URL: NSURL(string: "https://auspost.com.au/media/documents/domestic-parcels-guide-jan15.pdf")!)
//        self.uiWebView.loadRequest(urlRequest)
        self.uiWebView.loadRequest(urlRequestPDF)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Actions
    @IBAction func shareButton(sender: UIBarButtonItem) {
        let textToShare = "Look at this awesome website for aspiring iOS Developers!"
        let myWebsite = NSURL(string: "http://www.codingexplorer.com/")
        
        let objectsToShare:[AnyObject] = [textToShare, myWebsite!]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
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

