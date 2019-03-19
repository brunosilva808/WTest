import UIKit

class ThirdViewController: UITableViewController {

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
    
    var rowListSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }
    
    func setupView() {
        self.tableView.registerNib(for: TextFieldCell.self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
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
