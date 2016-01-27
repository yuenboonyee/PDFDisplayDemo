This project demonstrates how to share a PDF which is displayed in the UIWebView.

Method:
Use NSURLSession to retrieve the PDF data from the URL. Store the PDF data as NSData.
Display the NSData in a UIWebView.
Pass the NSData to a UIActivityViewController to present the sharing options for the 'share' button.
That's it.

References:
http://www.codingexplorer.com/add-sharing-to-your-app-via-uiactivityviewcontroller/
http://stackoverflow.com/questions/9569812/save-pdf-which-is-displayed-by-uiwebview-locally
http://iosameer.blogspot.com.au/2012/08/reading-and-downloading-pdf-in-ios-app.html