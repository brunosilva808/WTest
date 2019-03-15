import UIKit

class ThirdViewController: UITableViewController {

    var array: [TextFieldModel] = [TextFieldModel(type: .text, title: "Normal"),
                                   TextFieldModel(type: .number, title: "Números"),
                                   TextFieldModel(type: .capitalLetter, title: "Maiúscula"),
                                   TextFieldModel(type: .date, title: "Data"),
                                   TextFieldModel(type: .entry, title: "Lista")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(for: TextFieldCell.self)

        array.append(contentsOf: array)
        array.append(contentsOf: array)
        array.append(contentsOf: array)
        array.append(contentsOf: array)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.reusableCell(for: indexPath, with: array[indexPath.row]) as TextFieldCell
        return cell
    }
}
