//
//  Utilities.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/17/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import SDWebImage

class Utilities{
    
    
    //For getting colorcode based on hexvalue
    /**
     
     -parameter rgbValue: RGB value as UInt eg: 0x368ef4
     
     */
    
    class func ColorCodeRGB(_ rgbValue: UInt)-> UIColor
    {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: 1.0)
    }
    
    
    //For getting value stored in NSUserDefaults
    /**
     
     -parameter key: stored key as String
     
     */
    
    class func getDefaultValue(_ key:String) -> AnyObject?
    {
        
        let value = UserDefaults.standard.value(forKey: key)
        //        return  (value != nil) ? value! : nil
        return value as AnyObject?
        
    }
    
    class func getValueForkey(_ key:String) -> String {
        
        let value = UserDefaults.standard.value(forKey: key)
        return  (value != nil) ? value! as! String : ""
    }
    
    
    //For getting storing value in NSUserDefaults
    /**
     
     -parameter keyName : key name as String
     -parameter data    : data  as AnyObject
     
     */
    class func storeDataToDefaults(_ keyName:String, data:AnyObject)
    {
        
        if !data.isKind(of: NSNull.self){
            //        if !data.isKind(of: NSNull())
            //        {
            let defaults: UserDefaults = UserDefaults.standard
            defaults.setValue(data, forKey: keyName)
            defaults.synchronize()
        }
        
    }
    
    //For removing value stored in NSUserDefaults
    /**
     
     -parameter keyName: stored key name as String
     
     */
    
    class func removeDataFromDefaultsWithKey(_ keyName:String)
    {
        let defaults = UserDefaults.standard
        if (checkValueForKey(keyName))
        {
            defaults.removeObject(forKey: keyName)
            defaults.synchronize()
        }
    }
    
    //For checking if value stored in NSUserDefaults exists
    /**
     
     -parameter keyName: stored key name as String
     
     */
    
    class func checkValueForKey(_ keyName:String) -> Bool
    {
        if (UserDefaults.standard.object(forKey: keyName) != nil) {
            return true
        }else {
            return false
        }
    }
    
    // To validate email address with email validation characters
    
    func validateEmail(_ email:String) -> Bool {
        let emailTestPredicate = NSPredicate(format: "SELF MATCHES[c] %@", Constants.AppKeys.EMAIL_VALIDATION_CHARACTERS)
        return (emailTestPredicate.evaluate(with: email))
    }
    
    
    //For setting for to HelveticaNeue-Bold with specified size
    /**
     
     -parameter size: font size as CGFloat
     
     */
    class func myFontWithSize(_ size:CGFloat) -> UIFont
    {
        return UIFont(name: "HelveticaNeue-Bold", size: size)!
        
    }
    
    
    //For loading view from NIB for custom views
    /**
     
     -parameter viewName: viewName size as CGFloat
     -parameter atIndex: atIndex size as CGFloat
     -parameter aClass: aClass size as CGFloat
     -parameter parent: parent as NSObject
     
     
     */
    class func loadViewFromNib(_ viewName:String,atIndex:Int, aClass:AnyClass, parent:NSObject) -> AnyObject {
        
        let bundle = Bundle(for: aClass)
        
        let nib = UINib(nibName: viewName, bundle: bundle)
        
        let view = nib.instantiate(withOwner: parent, options: nil)[atIndex]
        
        return view as AnyObject
        
    }
    
//    class func showAlertViewMessageAndTitle(_ message:String, title:String, delegate:AnyObject?, cancelButtonTitle:String)
//    {
//        DispatchQueue.main.async(execute: {
//            let alert = UIAlertView(title: title, message: message, delegate: delegate, cancelButtonTitle: cancelButtonTitle)
//            alert.show()
//        })
//    }
    
    
    class func showAlertViewMessageWithTitle(_ message:String, title:String, delegate:UIViewController, cancelButtonTitle:String)
    {
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "Ok", style: .default)
            {
                UIAlertAction in
                
            }
            
            alertController.addAction(OKAction)
            delegate.present(alertController, animated: true, completion: nil)
        })
        
    }
    
    class func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    
    class func showLoadingWithTitle(_ title:String)
    {
        SVProgressHUD.show(withStatus: title)
        //        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    class func dismissLoading()
    {
        DispatchQueue.main.async(execute: {
            SVProgressHUD.dismiss()
            //            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        })
    }
    
    
    class func changeDateFormatFromDateAndTime(_ date : String, fromFormat:String, toFormat:String) -> (String){
        var dateFromDate : String! = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = toFormat
            dateFromDate = dateFormatter.string(from: date)
        }
        return dateFromDate.uppercased()
    }
    
    
    class func stringFromDate(_ date:Date, dateFormat:String) -> (String)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    
    
    class func getDate(_ newDate:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy, h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.locale = Locale(identifier: "en_US")
        let dateString = formatter.string(from: newDate)
        return dateString
    }
    
    class func time(fromDate date: Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.locale = Locale(identifier: "en_US")
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    class func getDateFromString(_ dateString:String) -> Date
    {
        let formatter = DateFormatter()
        formatter.dateFormat =  "EEE MMM d yyyy HH:mm:ss OOOO"  //Wed Mar 09 2016 18:31:54 GMT+0530 (IST)
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.locale = Locale(identifier: "en_US")
        
        return Date()
        //        return formatter.dateFromString(dateString)!
    }
    
    
    class func convertDateDays(_ currentDateStrings:String) -> String
    {
        var currentDateString = currentDateStrings
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.locale = Locale(identifier: "en_US")
        
        let sectionDate = formatter.date(from: currentDateString)
        
        
        //        let index = currentDateString.rangeOfString(",", options: .BackwardsSearch)?.startIndex
        //        let newDateString =  currentDateString.substringToIndex(index!)
        
        let calendar = Calendar.current
        
        if calendar.isDateInToday(sectionDate!)
        {
            //            currentDateString = currentDateString.stringByReplacingOccurrencesOfString(newDateString, withString: "Today", options: NSStringCompareOptions.LiteralSearch, range: nil)
            currentDateString = "Today"
        }
        else if calendar.isDateInYesterday(sectionDate!)
        {
            //            currentDateString = currentDateString.stringByReplacingOccurrencesOfString(newDateString, withString: "Yesterday", options: NSStringCompareOptions.LiteralSearch, range: nil)
            currentDateString = "Yesterday"
        }
        else
        {
            //            print("No change")
        }
        
        return currentDateString
        
    }
    
    
    
    
    
    //Checks if current VC in stack for back pressed
    
    class func isBackPressed(_ fromVC:UINavigationController,toVC:AnyClass) -> Bool
    {
        for controller in fromVC.viewControllers as Array {
            if controller.isKind(of: toVC) {
                return false
            }
        }
        
        return true
    }
    
    

    
    class  func showImageWithUrl(_ imageUrl:String, activityIndicator:UIActivityIndicatorView, onImageView:UIImageView, dummyImage:String) {
        
        let manager:SDWebImageManager = SDWebImageManager.shared()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        manager.imageDownloader?.downloadImage(with: URL(string: imageUrl), options: [], progress: { (receivedSize, expectedSize, url) in
            // progress tracking code
        }, completed: { (image, data, error, status) in
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            if ((image) != nil) {
                onImageView.image = image
                onImageView.contentMode = UIViewContentMode.scaleAspectFit
            }
            else
            {
                onImageView.image = UIImage(named: dummyImage)
                
            }
            
        })
 
    }
    
    
    class  func showImageWithUrlType2(_ imageUrl:String, activityIndicator:UIActivityIndicatorView, onImageView:UIImageView, dummyImage:String) {
        
        //        let manager:SDWebImageManager = SDWebImageManager.sharedManager()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        //        onImageView.layer.cornerRadius = 10
        //        onImageView.layer.masksToBounds = true
        //        onImageView.contentMode = .ScaleAspectFill
        
        onImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: dummyImage), options: []) { (image, error, cacheType, imageUrl) in
            
            DispatchQueue.main.async(execute: { () -> Void in
                
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                
            })
            
            if (image != nil) {
                
                //                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                onImageView.layer.cornerRadius = 10
                onImageView.layer.masksToBounds = true
                onImageView.contentMode = .scaleAspectFill
                
                //                    let qualityOfServiceClass = QOS_CLASS_BACKGROUND
                //                    let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
                //
                //                    dispatch_async(backgroundQueue, {
                //
                //                         Utilities.saveImageAtPathWithFileName(imageUrl.path!, image: image, withQuality: 1.0)
                //
                //                        })
                //                    })
                
                //                print("Image Loaded from:\(imageUrl.path!)")
            }
            
        }
        
        
    }
    
    
    
    class  func showImageWithUrlType3(_ imageUrl:String, activityIndicator:UIActivityIndicatorView, onImageView:UIImageView, dummyImage:String) {
        
        //        let manager:SDWebImageManager = SDWebImageManager.sharedManager()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        SDImageCache.shared().queryCacheOperation(forKey: imageUrl) { (image, data, cacheType) in
            
            //        }
            //        SDImageCache.shared().queryDiskCache(forKey: imageUrl, done: { (image, cacheType) in
            
            if image != nil
            {
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                onImageView.image = image
                onImageView.layer.cornerRadius = 10
                onImageView.layer.masksToBounds = true
                onImageView.contentMode = .scaleAspectFill
            }
            else
            {
                showImageWithUrlType2(imageUrl, activityIndicator: activityIndicator, onImageView: onImageView, dummyImage: dummyImage)
            }
        }
        
    }
    
    
    
    
    
    class func popViewController(_ fromVC:UINavigationController,toVC:AnyClass)
    {
        for controller in fromVC.viewControllers as Array {
            if controller.isKind(of: toVC) {
                fromVC.popToViewController(controller as UIViewController, animated: true)
                break
            }
        }
    }
    
    
    class func imageWithColor(_ color:UIColor) -> UIImage {
        let rect:CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        return image;
    }
    
    
    /*===============================================================================*/
    // MARK: - DocumentDirectory Helper methods
    /*===============================================================================*/
    
    
    class func loadImageFromPath(_ path: String) -> UIImage? {
        
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(Constants.AppKeys.DOWNLOAD_FOLDER).appendingPathComponent(path)
        
        let image = UIImage(contentsOfFile: fileURL.path)
        
        if image == nil {
            
            //Error loading image
        }
        
        return image
        
    }
    
    
    class func deleteImageFromPath(_ path:String) {
        
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(Constants.AppKeys.DOWNLOAD_FOLDER).appendingPathComponent(path)
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                //                print("old image has been removed")
            } catch {
                //                print("an error during a removing")
            }
        }
    }
    
    
    
    class func createDirectoryForImages()
    {
        
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(Constants.AppKeys.DOWNLOAD_FOLDER)
        
        if !FileManager.default.fileExists(atPath: fileURL.path)
        {
            
            do {
                try FileManager.default.createDirectory(
                    at: URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(Constants.AppKeys.DOWNLOAD_FOLDER),
                    withIntermediateDirectories: true,
                    attributes: nil)
                
            } catch _ as NSError {
                
                //                print("Creating 'download' directory failed. Error: ")
            }
        }
        
    }
    
    class func saveImageAtPathWithFileName(_ filename: String,image: UIImage, withQuality:CGFloat) {
        
        createDirectoryForImages()
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(Constants.AppKeys.DOWNLOAD_FOLDER).appendingPathComponent(filename)
        
        let jpgImageData = UIImageJPEGRepresentation(image, withQuality)
        
        do{
            try jpgImageData?.write(to: URL(fileURLWithPath: fileURL.path), options: [.atomic])
        }
        catch let error{
            print("saveImageAtPathWithFileName failed with error: ", error.localizedDescription)
        }
       
    }
    
    class func isFileAvailableLocal(_ imageURL:String) -> Bool
    {
        createDirectoryForImages()
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(Constants.AppKeys.DOWNLOAD_FOLDER).appendingPathComponent(imageURL)
        
        if FileManager.default.fileExists(atPath: fileURL.path)
        {
            return true
        }
        
        return false
    }
    
    
}

extension UILabel {
    func resizeLabelToFit(_ fontSize: CGFloat) {
        
        let labelString:NSString = self.text! as NSString
        let myStringSize:CGSize = labelString.size(withAttributes: [NSAttributedStringKey.font:Utilities.myFontWithSize(fontSize)])
        
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: myStringSize.width, height: myStringSize.height)
        
    }
}
