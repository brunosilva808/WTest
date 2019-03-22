import UIKit

class SecondViewController: UITableViewController {

    let headerView = HeaderView.fromNib()
    var headerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Second View Controller"
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.headerView.updateData(imageLink: "https://data.whicdn.com/images/308467301/large.png")
        return self.headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.bounds.width / 2.0
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.navigationController!.navigationBar.alpha = 1 - ((self.tableView.contentOffset.y * 2) / (self.tableView.contentSize.height - self.tableView.frame.size.height));
    }

}
