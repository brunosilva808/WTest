import UIKit

class FirstViewController: UITableViewController {

    private var searchController = UISearchController(searchResultsController: nil)
    private var postalCodesRequest = Request.PostalCode()
    private var filterPostalCodes: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getPostalCodes()
        self.setupSearchController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }

    func getPostalCodes() {
        NetworkManagerNew().response(with: postalCodesRequest, page: 0, onSuccess: { [weak self] (response) in
            CSV.shared.csv(data: response)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.searchController.searchBar.becomeFirstResponder()
            }
            }, onError: { (error) in
                
        }) {
            
        }
    }
    
}

extension FirstViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if self.isFiltering() {
            cell.textLabel?.text = self.filterPostalCodes[indexPath.row]
        } else {
            cell.textLabel?.text = CSV.shared.getText(row: indexPath.row)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.isFiltering() {
            return self.filterPostalCodes.count
        }
        
        return CSV.shared.postalCodes.count
    }
}

// MARK: - Search Bar methods
extension FirstViewController {
    
    private func searchBarIsEmpty() -> Bool {
        return self.searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        self.filterPostalCodes = CSV.shared.postalCodes.filter { if $0.lowercased().contains(searchText.lowercased()) {
            return true
        } else {
            return false
            }
        }
        
        self.tableView.reloadData()
    }
    
    private func isFiltering() -> Bool {
        return self.searchController.isActive && !self.searchBarIsEmpty()
    }
}

extension FirstViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            self.filterContentForSearchText(text)
        }
    }
    
}
