//
//  ResultsViewController.swift
//  YelpRBC
//
//  Created by Reid Ellis on 2016-10-11.
//  Copyright © 2016 Tnir Technologies. All rights reserved.
//

import Foundation
import UIKit
import NFImageView
import SwiftyJSON

class ResultsViewController : UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet var tableView : UITableView!
	@IBOutlet var searchBar : UISearchBar!
	@IBOutlet var yelp : Backend? = nil
	let startingSearch = "Ethiopian"

	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		self.searchForSearchbarText(searchBar)
	}
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		self.searchForSearchbarText(searchBar)
	}

	func searchForSearchbarText(_ searchBar: UISearchBar) {
		if let text = searchBar.text {
			yelp!.search(for: text, andThen: {
				self.tableView.reloadData()
			})
		}
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let backend = self.yelp, let results = backend.results else {
			return 0
		}
		return min(results["businesses"].arrayValue.count, 10)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let pcell = tableView.dequeueReusableCell(withIdentifier: "place") as! PlaceCell

		guard let backend = self.yelp, let results = backend.results else {
			return pcell
		}
		pcell.titleLabel?.text = results["businesses"].arrayValue[indexPath.row]["name"].stringValue
		let details = results["businesses"].arrayValue[indexPath.row]
		let url = details["image_url"].stringValue
		let link = details["url"].stringValue
		let rating = details["rating"].intValue
		let phone = details["phone"].stringValue
		let long = details["coordinates"]["longitude"].floatValue
		let lat = details["coordinates"]["latitude"].floatValue
		let city = details["location"]["city"].stringValue
		let addr1 = details["location"]["address1"].stringValue
		let addr2 = details["location"]["address2"].stringValue
		let addr3 = details["location"]["address3"].stringValue
		let code = details["location"]["zip_code"].stringValue
		let prov = details["location"]["state"].stringValue
		let country = details["location"]["country"].stringValue
		pcell.placeImageView?.loadingType = .spinner
		pcell.placeImageView?.contentViewMode = .aspectFill
		pcell.placeImageView?.setImageFromURLString(url)
		if addr1 != nil {
			if addr2 != nil {
				if addr3 != nil {
					pcell.placeTextView?.text = "\(addr1), \(addr2), \(addr3)"
				} else {
					pcell.placeTextView?.text = "\(addr1), \(addr2)"
				}
			} else {
				pcell.placeTextView?.text = "\(addr1)"
			}
		}
		pcell.details = details
		return pcell
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if(segue.identifier == "showDetail") {
			let pcell = sender as! PlaceCell
			let detailView = segue.destination.childViewControllers[0] as! DetailViewController
			detailView.details = pcell.details
		}
	}

	override func viewDidLoad() {
		yelp?.search(for: startingSearch, andThen: {
			self.tableView.reloadData()
		})
	}

	override func viewWillAppear(_ animated: Bool) {
		self.searchBar.placeholder = "Enter search"
		self.searchBar.text = startingSearch
	}
}
