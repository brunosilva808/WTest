//
//  HeaderView.swift
//  WTest
//
//  Created by Carbon on 15/03/2019.
//  Copyright © 2019 Carbon. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet private weak var headerImageView: UIImageView!

    func updateData(imageLink: String){
        self.headerImageView.loadImageUsingUrlString(urlString: imageLink)
    }
}
