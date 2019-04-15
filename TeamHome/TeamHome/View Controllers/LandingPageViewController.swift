//
//  LandingPageViewController.swift
//  TeamHome
//
//  Created by Daniela Parra on 1/10/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit
import Apollo
import Auth0
import Material


let auth0DomainURLString = "manaje.auth0.com"
let credentialsManager = CredentialsManager.init(authentication: Auth0.authentication())


class LandingPageViewController: UIViewController, UITextFieldDelegate {

    // MARK - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets up view appearance settings like view background and more.
        setUpAppearance()

        //        Auth0.webAuth().clearSession(federated: true) { (result) in
//            print("cleared")
//        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Credential manager checks if user has a valid token.
        guard credentialsManager.hasValid() else { return }

        // Fetches the credentials.
        credentialsManager.credentials { (error, credentials) in
            if let error = error {
                NSLog("\(error)")
                return
            }

            // Unwrap idToken to use for Apollo and to decode.
            guard let credentials = credentials,
                let idToken = credentials.idToken else { return }

            // Set up Apollo client with idToken from auth0.
            guard let  authId = self.decodePayload(tokenstr: idToken) else {return}
            let newId = String(authId.split(separator: "|")[1])
            self.setUpApollo(with: idToken)

            guard let apollo = self.apollo else {return}

            apollo.fetch(query: CurrentUserQuery(authId: newId), queue: DispatchQueue.global(), resultHandler: { (result, error) in
                if let error = error {
                    NSLog("Error logging in: \(error)")
                    return
                }

                guard let result = result,
                    let data = result.data else {
                        // Perform other segue
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "ShowNewUser", sender: self)
                        }
                        return
                }
                let currentUser = data.user
                self.currentUser = currentUser
                print(currentUser.name ?? "")

                // Perform segue to Dashboard VC.
                self.performSegue(withIdentifier: "ShowDashboard", sender: self)
            })
        }
    }


    // MARK: - IBActions

    // To unwind to this view from settings view when user logs out.
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    // Google Authentication through Web Auth.
    @IBAction func googleLogIn(_ sender: Any) {
        Auth0
            .webAuth()
            .audience("https://manaje.auth0.com/userinfo")
            .connection("google-oauth2")
            .scope("openid profile email")
            .start { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let credentials):

                        // Unwrap tokens to use for Apollo and to decode.
                        guard let idToken = credentials.idToken else { return }

                        guard let  authId = self.decodePayload(tokenstr: idToken) else {return}
                        let newId = String(authId.split(separator: "|")[1])
                        // Set up Apollo client with idToken from auth0.
                        self.setUpApollo(with: idToken)

                        // Store credentials with manager for future handling
                        _ = credentialsManager.store(credentials: credentials)

                        guard let apollo = self.apollo else {return}

                        apollo.fetch(query: CurrentUserQuery(authId: newId), queue: DispatchQueue.global(), resultHandler: { (result, error) in
                            if let error = error {
                                NSLog("Error logging in with google: \(error.localizedDescription)")
                                return
                            }

                            guard let result = result,
                                let data = result.data else {
                                    // Perform other segue
                                    self.performSegue(withIdentifier: "ShowNewUser", sender: self)
                                    return
                            }
                            NSLog("\(data)")
                             let currentUser = data.user
                            self.currentUser = currentUser
            

                            // Perform segue to Dashboard VC.
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "ShowDashboard", sender: self)
                            }
                           
                        })

                    case .failure(let error):

                        // Present alert to user and bring back to landing page
                        self.presentAlert(for: error)
                    }
                }
        }
    }

    // Github Authentication through Web Auth.
    @IBAction func facebookLogIn(_ sender: Any) {
        Auth0
            .webAuth()
            .audience("http://manaje.auth0.com/userinfo")
            .connection("facebook")
            .scope("openid")
            .start { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let credentials):

                        // Unwrap tokens to use for Apollo and to decode.
                        guard let idToken = credentials.idToken else { return }

                        // Set up Apollo client with idToken from auth0.
                        self.setUpApollo(with: idToken)

                        // Store credentials with manager for future handling
                    _ = credentialsManager.store(credentials: credentials)

                        guard let apollo = self.apollo else {return}

                        apollo.fetch(query: CurrentUserQuery(), queue: DispatchQueue.global(), resultHandler: { (result, error) in
                            if let error = error {
                                NSLog("Error logging in with facebook: \(error)")
                                return
                            }

                            guard let result = result,
                                let data = result.data else {
                                    // Perform other segue
                                    self.performSegue(withIdentifier: "ShowNewUser", sender: self)
                                    return
                            }
                            let currentUser = data.user
                            self.currentUser = currentUser
                
                            // Perform segue to Dashboard VC.
                            self.performSegue(withIdentifier: "ShowDashboard", sender: self)
                        })


//                        // Perform segue to Dashboard VC.
//                        self.performSegue(withIdentifier: "ShowDashboard", sender: self)


                    case .failure(let error):

                        // Present alert to user and bring back to landing page
                        self.presentAlert(for: error)
                    }
                }
        }
   }
//
   @IBAction func logIn(_ sender: Any) {
        Auth0
            .authentication()

            .login(
                usernameOrEmail: self.emailTextField.text!,
                password: self.passwordTextField.text!,
                realm: "Username-Password-Authentication",
                scope: "openid profile")
            .start { result in

                DispatchQueue.main.async {
                    switch result {
                    case .success(let credentials):

                        // Unwrap tokens to use for Apollo and to decode.
                        guard let idToken = credentials.idToken else { return }

                        // Set up Apollo client with idToken from auth0.
                        self.setUpApollo(with: idToken)

                        // Store credentials with manager for future handling
                        _ = credentialsManager.store(credentials: credentials)

                        guard let apollo = self.apollo else {return}

                        apollo.fetch(query: CurrentUserQuery(), cachePolicy: .returnCacheDataElseFetch, queue: DispatchQueue.global(), resultHandler: { (result, error) in
                            if let error = error {
                                NSLog("Error logging in with google: \(error)")
                                return
                            }

                            guard let result = result,
                                let data = result.data else {
                                    // Present alert and suggest to sign up and not sign in?

                                    return
                            }
                            let currentUser = data.user  
                            self.currentUser = currentUser
                            print(currentUser.name)

                            // Perform segue to Dashboard VC.
                            self.performSegue(withIdentifier: "ShowDashboard", sender: self)
                        })


//                        // Perform segue to Dashboard VC.
//                        self.performSegue(withIdentifier: "ShowDashboard", sender: self)

                    case .failure(let error):

                        // Present alert to user and bring back to landing page
                        self.presentAlert(for: error)
                    }
                }
        }
    }

    @IBAction func signUp(_ sender: Any) {
        let password = passwordTextField.text!

        Auth0
            .authentication()
            .createUser(
                email: emailTextField.text!,
                password: password,
                connection: "Username-Password-Authentication"
            )
            .start { result in
                switch result {
                case .success(let user):
                    print("User Signed up: \(user)")
                    Auth0
                        .authentication()
                        .login(
                            usernameOrEmail: user.email,
                            password: password,
                            realm: "Username-Password-Authentication",
                            scope: "openid profile")
                        .start { result in

                            print(result)

                            DispatchQueue.main.async {

                                switch result {
                                case .success(let credentials):

                                    print(credentials)

                                    // Unwrap tokens to use for Apollo and to decode.
                                    guard let idToken = credentials.idToken else { return }

                                    // Set up Apollo client with idToken from auth0.
                                    self.setUpApollo(with: idToken)

                                    // Store credentials with manager for future handling
                                    _ = credentialsManager.store(credentials: credentials)

                                    // Store user information
                                    self.user = user

                                    // Perform segue to Dashboard VC.
                                    self.performSegue(withIdentifier: "ShowNewUser", sender: self)

                                case .failure(let error):

                                    print(error)
                                    // Present alert to user and bring back to landing page
                                    self.presentAlert(for: error)
                                }
                            }
                    }
                case .failure(let error):
                    print("this error: \(error)")

                    self.presentAlert(for: error)
                }

            }
   }

//     MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Pass to Dashboard Collection VC
        if segue.identifier == "ShowDashboard" {
           guard let destinationVC = segue.destination as? DashboardCollectionViewController,
               //let topView = destinationVC.topViewController,
                //let nextVC = topView as? DashboardCollectionViewController,

                let apollo = apollo,
                let currentUser = currentUser else { return }

            // Pass Apollo client.
            destinationVC.currentUser = currentUser
            destinationVC.apollo = apollo

      } else if segue.identifier == "ShowNewUser" {
            guard let destinationVC = segue.destination as? CreateNewUserViewController,
                let apollo = apollo,
                let user = user else { return }

            // Pass Apollo client.
            destinationVC.apollo = apollo
            destinationVC.user = user
        }
    }

    // MARK: - Keyboard Animation and Delegate functions

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: - Private Methods

    // Create gradient layer for view background.
    private func createGradientLayer() {
        gradientLayer = CAGradientLayer()

        gradientLayer.frame = self.view.bounds

        gradientLayer.colors = [Appearance.grayColor.cgColor, Appearance.likeGrayColor.cgColor, Appearance.grayColor.cgColor]


        gradientLayer.locations = [0.0, 0.5]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // Set up Apollo client with http headers
    private func setUpApollo(with idToken: String) {
        // Set up Apollo client with idToken from auth0.
        self.apollo = {
            let configuration = URLSessionConfiguration.default
            // Add additional headers as needed
            configuration.httpAdditionalHeaders = ["Authorization": "\(idToken)"]

            let url = URL(string: "https://manaje-graphql.herokuapp.com/")!

            return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        }()
    }

    func decodePayload(tokenstr: String) -> String? {
        var newId: String?
        //splitting JWT to extract payload
        let arr = tokenstr.split(separator: ".")
        var base64String = String(arr[1])
        
        if base64String.count % 4 != 0 {
            let padlen = 4 - base64String.count % 4
            base64String.append(contentsOf: repeatElement("=", count: padlen))
        }
        
        let jsonDecoder = JSONDecoder()
        
        guard let data = Data(base64Encoded: base64String) else {return nil}
        let auth = try! jsonDecoder.decode(User.self, from: data)
        let str = String(data: data, encoding: .utf8)

        print(str)
        return auth.sub
    }
    
    
    // Present alert to user for auth0 errors
    private func presentAlert(for error: Error) {
        //For testing
        print("Failed with \(error)")
    }


    private func setUpAppearance() {

        createGradientLayer()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        hideKeyboardWhenTappedAround()

        emailTextField.delegate = self
        passwordTextField.delegate = self

        passwordTextField.placeholder = "Password"
        passwordTextField.detail = ""
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.isVisibilityIconButtonEnabled = true
        passwordTextField.dividerNormalColor = .white
        passwordTextField.placeholderActiveColor = Appearance.yellowColor
        passwordTextField.detailColor = .white
        passwordTextField.placeholderAnimation = .hidden
        passwordTextField.textColor = .white
        passwordTextField.dividerActiveColor = Appearance.yellowColor

        emailTextField.dividerNormalColor = .white
        emailTextField.placeholder = "Email"
        emailTextField.placeholderAnimation = .hidden
        emailTextField.isClearIconButtonEnabled = true
        emailTextField.textColor = .white
        emailTextField.dividerActiveColor = Appearance.yellowColor
        emailTextField.placeholderActiveColor = Appearance.yellowColor


        // Setting the visibilityIconButton color.
        passwordTextField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordTextField.isSecureTextEntry ? 0.38 : 0.54)

        self.setUpViewAppearance()

        Appearance.styleLandingPage(button: loginButton)
        Appearance.styleLandingPage(button: signupButton)

    }

    // Makes status bar text white.
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Properties

    private var apollo: ApolloClient?
    private var credentials: Credentials?
    private var user: DatabaseUser?
    private var currentUser: CurrentUserQuery.Data.User?
    private var gradientLayer: CAGradientLayer!

//    //All IBOutlets on storyboard view scene
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var briefInfoLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var googleLogoButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!

}
