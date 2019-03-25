import UIKit

class FirstViewController: UITableViewController {

    private var postalCodesRequest = Request.PostalCode()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManagerNew().response(with: postalCodesRequest, page: 0, onSuccess: { [weak self] (response) in
            CSV.shared.csv(data: response)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }, onError: { (error) in

        }) {

        }
    }

}

extension FirstViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = CSV.shared.getRow(indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CSV.shared.postalCodes.count
    }
}

