//
//  ViewController.swift
//  KeyChain
//
//  Created by 핏투비 on 2022/12/26.
//
// source link: https://www.youtube.com/watch?v=UhjyZOexSNc
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        print(ENV.SERVICE_API_KEY)
        print("hi")
        // Do any additional setup after loading the view.
    }
}


// You Should Never STORE Important Key on Client Side like API Key.

class BaseENV {
    let dict: NSDictionary
    
    enum Key: String {
        case SERVICE_API_KEY
        
    }
    
    init(resourceName: String) {
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist") else {
            fatalError("Couldn't find the file '\(resourceName).plist.")
        }
        guard let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Plist corrupted")
        }
        self.dict = plist
    }
}

protocol APIKeyables {
    var SERVICE_API_KEY: String { get }
}

class DebugENV: BaseENV, APIKeyables {
    init() {
        super.init(resourceName: "DEBUG-Keys")
    }
    
    var SERVICE_API_KEY: String {
        return dict.object(forKey: Key.SERVICE_API_KEY.rawValue) as? String ?? ""
    }
}

class ProdENV: BaseENV, APIKeyables {
    init() {
        super.init(resourceName: "PROD-Keys")
    }
    
    var SERVICE_API_KEY: String {
        return dict.object(forKey: Key.SERVICE_API_KEY.rawValue) as? String ?? ""
    }
}

