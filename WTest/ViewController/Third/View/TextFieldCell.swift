import UIKit

class TextFieldCell: UITableViewCell, ModelPresenterCell {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var button: UIButton!
    
    private let datePickerView = UIDatePicker()
    var delegate: ButtonProtocol?
    var model: TextFieldModelEnum? {
        didSet {
            if let model = model {
                self.label.text = model.info.title
                self.setCell(type: model.info.type)
                if model.info.type == .entry {
                    self.textField.text = model.info.entry
                }
            }
        }
    }

    private func setCell(type: TextFieldType)  {
        
        self.button.isHidden = true
        
        switch type {
        case .text:
            self.textField.keyboardType = .default
        case .number:
            self.textField.keyboardType = .numberPad
        case .capitalLetter:
            self.textField.keyboardType = .default
            self.textField.autocapitalizationType = .sentences
        case .date:
            self.setDatePicker()
        case .entry:
            self.button.isHidden = false
        }
    }
    
    func setDatePicker() {

        datePickerView.datePickerMode = UIDatePicker.Mode.date
        self.textField.inputView = datePickerView

        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    // MARK: - IBAction
    
    @IBAction func buttonPressed(_ sender: Any) {
        self.delegate?.buttonPressed(row: self.tag)
    }
    
    @objc
    func datePickerValueChanged() {

        self.button.isHidden = false
        
        self.textField.text = self.datePickerView.date.description

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: self.datePickerView.date)
        
        self.textField.text = selectedDate
    }
    
}
