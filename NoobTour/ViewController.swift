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
        // Do any additional setup after loading the view.
        loginButton.delegate = self
        loginButton.permissions = ["public_profile", "email"]
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
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController : LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
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

