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
        
        if CoreDataManager.shared.isEmpty {
            
            NetworkManagerNew().response(with: postalCodesRequest, page: 0, onSuccess: { [weak self] (response) in
                CSV.shared.csv(data: response)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.searchController.searchBar.becomeFirstResponder()
                }
                }, onError: { (error) in
            }) {}
        } else {

            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.searchController.searchBar.becomeFirstResponder()
            }

        }
    }
    
}

extension FirstViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = CoreDataManager.shared.getData(searchText: self.searchController.searchBar.text ?? "")[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CoreDataManager.shared.numberOfItems
    }
}

// MARK: - Search Bar methods
extension FirstViewController {
    
    private func searchBarIsEmpty() -> Bool {
        
        return self.searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        CoreDataManager.shared.searchText = searchText
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
