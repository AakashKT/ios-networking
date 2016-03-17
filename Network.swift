//
//  network.swift
//  Yocket
//
//  Created by Aakash on 12/23/15.
//  Copyright © 2015 Avocation Educational Services. All rights reserved.
//

import Foundation

class Network {
    
    private var urlString:NSString?;
    private var urlObj:NSURL?;
    private var urlRequest:NSMutableURLRequest?;
    private var session:NSURLSession?;
    private var task:NSURLSessionDataTask?;
    private var username:NSString?;
    private var authKey:NSString?;
    private var config:NSURLSessionConfiguration?;
    private var type:String?;
    
    var serverData:NSData?;
    var response:NSURLResponse?;
    var error:NSError?;
    
    init(url:String, username:String, authKey:String, type:String) {
        let urlFormatted = url.stringByReplacingOccurrencesOfString(" ", withString: "%20");
        
        self.urlString = urlFormatted;
        self.username = username;
        self.authKey = authKey;
        self.type = type;
        
        let loginString = "\(username):\(authKey)";
        let loginData = loginString.dataUsingEncoding(NSUTF8StringEncoding);
        let base64 = loginData?.base64EncodedStringWithOptions([]);
        let auth = "Basic \(base64!)";
        
        config = NSURLSessionConfiguration.defaultSessionConfiguration();
        config?.HTTPAdditionalHeaders = ["Authorization" : auth];
        
        urlObj = NSURL(string: urlFormatted);
        urlRequest = NSMutableURLRequest(URL: urlObj!);
        urlRequest?.HTTPMethod = type;
        
        session = NSURLSession(configuration: config!);
    }
    
    init(url:String, type:String) {
        self.urlString = url;
        
        urlObj = NSURL(string: url);
        urlRequest = NSMutableURLRequest(URL: urlObj!);
        urlRequest?.HTTPMethod = type;
        
        self.type = type;
        
        session = NSURLSession.sharedSession();
    }
    
    func getData(onDownloadFinish: (error:NSError?) -> Void) {
        task = session?.dataTaskWithRequest(urlRequest!, completionHandler: {
            (serverData, response, error) -> Void in
            
            self.serverData = serverData;
            self.response = response;
            self.error = error;
            
            onDownloadFinish(error: error);
        });
        
        task?.resume();
    }
    
    func sendData(parameterString:String, onReceive: (error:NSError?) -> Void) {
        if(self.type == "POST")
        {
            urlRequest?.HTTPBody = parameterString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false);
        }
        
        task = session?.dataTaskWithRequest(urlRequest!, completionHandler: {
            (serverData, response, error) -> Void in
            
            self.serverData = serverData;
            self.response = response;
            self.error = error;
            
            onReceive(error: error);
        });
        
        task?.resume();
        
    }
    
    
}