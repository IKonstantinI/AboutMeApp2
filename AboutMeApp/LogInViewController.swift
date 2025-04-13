//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Konstantin on 10.04.2025.
//

import UIKit

final class LogInViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName = "User"
    private let password = "123"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loginVC = segue.destination as? GreetingsViewController else { return }
        loginVC.welcomeName = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with:  event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            showAlert(
                with: "Oops!",
                and: "Uncorrect user name or password") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    private func showAlert(with title: String, and message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func forgotUserNameTapped() {
        showAlert(with: "Oops!", and: "Your name is \(userName) 😉")
    }
    
    @IBAction func forgotPasswordTapped() {
        showAlert(with: "Oops!", and: "Your password is \(password) 😉")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
}

