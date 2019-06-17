//
//  ViewController.swift
//  NoobTour
//
//  Created by TheAnh on 6/10/19.
//  Copyright © 2019 noobfromandroid. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: FBLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginWithFacebook() {
        let fbLoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile","email"], from: self) { (result, error) -> Void in
            if let error = error {
                self.showDialogMessage(title: "Login failed", message: error.localizedDescription)
                return
            }
            if (result?.isCancelled)!{
                return
            }
            if let accessToken = AccessToken.current?.tokenString {
                self.authFirebase(accessToken : accessToken)
            }
        }
    }
    
    func authFirebase(accessToken : String) {
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                self.showDialogMessage(title: "Login failed", message: error.localizedDescription)
                return
            }
            self.showDialogMessage(title: "Congrats", message: "Login successfully")
        }
    }
    
    func showDialogMessage(title: String ,message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainController") as! MainController
            let navigationController = UINavigationController(rootViewController: vc)
            
            self.present(navigationController, animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
}
