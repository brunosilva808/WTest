import UIKit

class EntryTableViewController: UITableViewController {

    var delegate: TextProtocol?

    var array: [TextFieldModelEnum] = [TextFieldModelEnum(type: .text, title: "Normal"),
                                       TextFieldModelEnum(type: .number, title: "Números"),
                                       TextFieldModelEnum(type: .capitalLetter, title: "Maiúscula"),
                                       TextFieldModelEnum(type: .date, title: "Data"),
                                       TextFieldModelEnum(type: .entry, title: "Lista")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row].info.title
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.getText(text: array[indexPath.row].info.title)
        self.dismiss(animated: true, completion: nil)
    }
    
}
