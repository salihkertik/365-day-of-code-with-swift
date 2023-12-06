# UIAlertController

```swift
 @IBAction func controlButton(_ sender: Any) {
        presentAlert()
    }

    func presentAlert() {
        guard let enteredText = textField.text, !enteredText.isEmpty else {
            presentDefaultAlert(message: "Entered Empty")
            return
        }
        presentDefaultAlert(message: enteredText)
    }

    func presentDefaultAlert(message: String) {
        let alertControl = UIAlertController(title: "Entered Text", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertControl.addAction(okAction)
        alertControl.addAction(cancelAction)
        
        present(alertControl, animated: true, completion: nil)
    }

}
```
