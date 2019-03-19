import UIKit

class ThirdViewController: UITableViewController {

    var rowListSelected = 0
    var array: [TextFieldModelEnum] = [
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista"),
        TextFieldModelEnum(type: .text, title: "Normal"),
        TextFieldModelEnum(type: .number, title: "Números"),
        TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
        TextFieldModelEnum(type: .date, title: "Data"),
        TextFieldModelEnum(type: .entry, title: "Lista")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
//        self.setupNotifications()
    }
    
    func setupView() {
        self.tableView.registerNib(for: TextFieldCell.self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    func setupNotifications() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc func keyboardWillShow(notification: Notification) {
////        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
////
////            if self.view.frame.origin.y == 0 {
////                self.view.frame.origin.y -= keyboardSize.height
////            }
////        }
//
//        var keyboardHeight: CGFloat = 0.0
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            keyboardHeight = keyboardRectangle.height
//        }
//
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
//
//
//        self.tableView.contentInset = contentInsets
//        self.tableView.scrollIndicatorInsets = contentInsets
//
//        // If active text field is hidden by keyboard, scroll it so it's visible
//        // Your app might not need or want this behavior.
//        var aRect = self.view.frame
//        aRect.size.height -= keyboardHeight
//
//        if !CGRectContainsPoint(aRect, activeField!.frame.origin) {
//            self.tableView.scrollRectToVisible(activeField!.frame, animated: true)
//        }
//    }
//
//    @objc func keyboardWillHide(notification: Notification) {
////        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
////
////            if self.view.frame.origin.y != 0 {
////                self.view.frame.origin.y += keyboardSize.height
////            }
////        }
//
//        self.tableView.contentInset = .zero
//        self.tableView.scrollIndicatorInsets = .zero
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? EntryTableViewController {
            destinationViewController.delegate = self
        }
    }
    
    // MARK: - IBAction
    
    @objc func handleTap() {
        self.view.endEditing(true)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.reusableCell(for: indexPath, with: array[indexPath.row]) as TextFieldCell
        cell.tag = indexPath.row
        cell.delegate = self
        return cell
    }
}

extension ThirdViewController: ButtonProtocol {

    func buttonPressed(row: Int) {
        self.rowListSelected = row
        self.performSegue(withIdentifier: "Third->Entry", sender: row)
    }
}

extension ThirdViewController: TextProtocol {

    func getText(text: String) {
        self.array[self.rowListSelected].info.entry = text
        let indexPaths = [IndexPath(row: self.rowListSelected, section: 0)]
        self.tableView.reloadRows(at: indexPaths, with: .none)
    }
}
