//
//  DetailViewController.swift
//  YelpRBC
//
//  Created by Reid Ellis on 2016-10-08.
//  Copyright © 2016 Tnir Technologies. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailViewController: UIViewController {

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var addr1Label: UILabel!
	@IBOutlet weak var addr2Label: UILabel!
	@IBOutlet weak var addr3Label: UILabel!
	@IBOutlet weak var codeLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var detailDescriptionLabel: UILabel!
	var details: JSON? = nil

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		if let dict = details {
			// Do any additional setup after loading the view, typically from a nib.
			self.nameLabel.text = dict["name"].stringValue
			self.addr1Label.text = dict["location"]["address1"].stringValue
			self.addr2Label.text = dict["location"]["address2"].stringValue
			self.addr3Label.text = dict["location"]["address3"].stringValue
			self.codeLabel.text = dict["location"]["zip_code"].stringValue
			self.cityLabel.text = dict["location"]["state"].stringValue
			self.countryLabel.text = dict["location"]["country"].stringValue
		}
	}

}
