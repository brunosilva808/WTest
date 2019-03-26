import UIKit

class FirstViewController: UITableViewController {

    private var searchController = UISearchController(searchResultsController: nil)
    private var postalCodesRequest = Request.PostalCode()
    private var indicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.getPostalCodes()
        self.setupSearchController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupTableView() {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 44)
        self.tableView.tableFooterView = spinner
        self.tableView.tableFooterView?.isHidden = false
    }
    
    func setupSearchController() {
        
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.definesPresentationContext = true
    }

    func getPostalCodes() {
        
        if CoreDataManager.shared.isEmpty {
            
            self.tableView.tableFooterView?.isHidden = false
            
            NetworkManagerNew().response(with: postalCodesRequest, onSuccess: { [weak self] (response) in
                CSV.shared.csv(data: response)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.tableView.tableFooterView?.isHidden = true
                    self?.searchController.searchBar.becomeFirstResponder()
                }
                }, onError: { (error) in
            }) {}
        } else {

            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.searchController.searchBar.becomeFirstResponder()
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
