//
//  ViewController.swift
//  Circles
//
//  Created by Byron Gomez Jr on 8/15/22.
//

import UIKit
import CometChatPro

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let uid    = "SUPERHERO2"
        let authKey = "ddfaa71add7d4ef2d456ed80bff2186e06431a87"

        CometChat.login(UID: uid, apiKey: authKey, onSuccess: { (user) in

          print("Login successful: " + user.stringValue())
            self.openChat()
            
        }) { (error) in

          print("Login failed with error: " + error.errorDescription);

        }
        
    }
    
    func openChat() {
        DispatchQueue.main.async {
            let cometChatUI = CometChatUI()
            cometChatUI.setup(withStyle: .fullScreen)
            self.present(cometChatUI, animated: true, completion: nil)
        }
    }


}

