import UIKit


let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));

button.backgroundColor = .red;
button.layer.cornerRadius = 25;
button.clipsToBounds = true;


// Or we can create an extension to use later on in more places

extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true;
        self.layer.cornerRadius = self.frame.size.width / 2;
    }
}

let newButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
newButton.backgroundColor = .red;

newButton.makeCircular();


// We can also use extensions to extend protocols

