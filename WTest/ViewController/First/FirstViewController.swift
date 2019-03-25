import UIKit

class FirstViewController: UITableViewController {

    private var postalCodesRequest = Request.PostalCode()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManagerNew().response(with: postalCodesRequest, page: 0, onSuccess: { (response) in
            let csvRows = self.csv(data: response)
        }, onError: { (error) in

        }) {

        }
    }
    
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        var skip = true
        for row in rows {
            if skip == true {
                skip = false
                continue
            }
            let columns = row.components(separatedBy: ";")
            result.append(columns)
        }
        return result
    }

}

