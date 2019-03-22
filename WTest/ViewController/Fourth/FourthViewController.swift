import UIKit

class FourthViewController: UIViewController {

    @IBOutlet private weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.loadRequest(URLRequest(url: Configuration.Website.url))
    }

}
