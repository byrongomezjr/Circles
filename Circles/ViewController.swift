//
//  ViewController.swift
//  Circles
//
//  Created by Byron Gomez Jr on 8/15/22.
//

import UIKit
import CometChatPro
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let uid    = "byrongomezjr"
        let name = "Byron Gomez Jr"
        let authKey = "ddfaa71add7d4ef2d456ed80bff2186e06431a87"
        
        let newUser : User = User(uid: uid, name: name)
        newUser.avatar = "https://avatars.githubusercontent.com/u/60487113?v=4"

        CometChat.createUser(user: newUser, apiKey: authKey, onSuccess: { (User) in
              print("User created successfully. \(User.stringValue())")
          }) { (error) in
             print("The error is \(String(describing: error?.description))")
        }

        CometChat.login(UID: uid, apiKey: authKey, onSuccess: { (user) in
          print("Login successful: " + user.stringValue())
        }) { (error) in
          print("Login failed with error: " + error.errorDescription);
        }
        
        DispatchQueue.main.async {
        let cometChatUI = CometChatUI()
        cometChatUI.setup(withStyle: .fullScreen)
        self.present(cometChatUI, animated: true, completion: nil)
        }
    }
    }

