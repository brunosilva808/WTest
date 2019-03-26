import UIKit

class HeaderView: UIView {

    @IBOutlet private weak var headerImageView: UIImageView!

    func updateData(imageLink: String){
        self.headerImageView.loadImageUsingUrlString(urlString: imageLink)
    }
}
