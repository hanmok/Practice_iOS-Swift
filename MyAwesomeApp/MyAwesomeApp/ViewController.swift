//
//  ViewController.swift
//  MyAwesomeApp
//
//  Created by 핏투비 on 2022/12/22.
//

import UIKit
import DesignKit
import NetworkKit
import NetworkKitV2

class ViewController: UIViewController {

    private let designKit: DesignKit = DesignKitImp()
    private let networkKit = NetworkKitImp()
    
    private lazy var redView: UIView = {
//        return DesignKitImp().buildRedView()
//        return designKit.buildRedView()
        return designKit.buildView(themeColor: .bgColor1)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        fetchUsers()
    }
    
    
    
    private func setupViews() {
        [redView].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            redView.heightAnchor.constraint(equalToConstant: 200),
            redView.widthAnchor.constraint(equalToConstant: 200),
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func fetchUsers() {
        NetworkKitV2Imp().getSth()
        
        Task {
            do {
                let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
                let users: [User] = try await networkKit.get(url: url)
                print(users.first)
            } catch {
                
            }
        }
    }
}

struct User: Decodable {
    let name: String
    let email: String
}
