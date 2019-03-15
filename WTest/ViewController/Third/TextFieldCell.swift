import UIKit

class TextFieldCell: UITableViewCell, ModelPresenterCell {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var textField: UITextField!
    
    var model: TextFieldModel? {
        didSet {
            if let model = model {
                self.label.text = model.title
                self.setCell(type: model.type)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func setCell(type: TextFieldType)  {
        switch type {
        case .text:
            self.textField.keyboardType = .default
        case .number:
            self.textField.keyboardType = .numberPad
        case .capitalLetter:
            self.textField.keyboardType = .default
            self.textField.autocapitalizationType = .sentences
        case .date:
            self.textField.keyboardType = .default
        case .entry:
            self.textField.keyboardType = .default
        }
    }
    
}
