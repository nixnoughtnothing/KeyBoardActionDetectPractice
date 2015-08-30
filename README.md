# KeyBoardActionDetectPractice

### Demo

![](https://github.com/nixnoughtnothing/KeyBoardActionDetectPractice/blob/master/readme_images/image1.png)
![](https://github.com/nixnoughtnothing/KeyBoardActionDetectPractice/blob/master/readme_images/image2.png)


### Code
```Swift
// Add the codes below in your viewcontroller to handle your keyboard actions
override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidShow:", name: "UIKeyboardWillShowNotification", object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: "UIKeyboardWillHideNotification", object: nil)
    }
    
override func viewDidAppear(animated: Bool) {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: "UIKeyBoardWillShowNotification", object: nil)
    NSNotificationCenter.defaultCenter().removeObserver(self, name: "UIKeyBoardWillHideNotification", object: nil)
}

// MARK: - Observer Action
func keyboardDidShow(notification:NSNotification){
    print("keyboardDidShow:")
}

func keyboardWillHide(notification:NSNotification){
    print("keyboardWillHide")
}
```
