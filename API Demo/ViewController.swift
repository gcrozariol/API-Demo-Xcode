//
//  ViewController.swift
//  API Demo
//
//  Created by Guilherme Henrique Crozariol on 2017-01-03.
//  Copyright © 2017 Lion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.wunderground.com")
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            if error != nil {
                
                print(error as Any)
                
            } else {
                
                do {
                
                    if let urlContent = data {
                    
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                        print(jsonResult)
                    
                    }
                    
                } catch {
                    
                    print("JSON Processing Failed")
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

