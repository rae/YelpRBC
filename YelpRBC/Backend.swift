//
//  backend.swift
//  YelpRBC
//
//  Created by Reid Ellis on 2016-10-10.
//  Copyright © 2016 Tnir Technologies. All rights reserved.
//

import Foundation
import Alamofire
//import p2_OAuth2
import OAuthSwift

class Backend {

	fileprivate	static let apiKey = "v1KQWvOJli4Y69nvfBr4DQ"
	fileprivate	static let secret = "acNRn4t246u2CWRR3EzG4US38ApoyaRcWb7ouVFXwFwNaYZI4uLz59G4Atz0uMdU"
	fileprivate	static let apiUrlString = "https://api.yelp.com/v3"
	fileprivate static let searchString = "businesses/search/"

//	var loader: OAuth2DataLoader?
//
//	let oauth2 = OAuth2CodeGrant(settings: [
//		"grant_type": "client_credentials",
//		"client_id": apiKey,
//		"client_secret": secret,
//		"authorize_uri": apiUrlString,
//		"keychain": false,         // if you DON'T want keychain integration
//		] as OAuth2JSON)
//
//	open func load() {
//		let base = URL(string: Backend.apiUrlString)!
//		let url = base.appendingPathComponent(Backend.searchString + "Thai?term=restaurants")
//
//		var req = oauth2.request(forURL: url)
//		req.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
////		let postString = "grant_type=client_credentials"
////			+ "&client_id=\(Backend.apiKey)"
////			+ "&client_secret=\(Backend.secret)"
////		req.httpBody = postString.data(using: .utf8)
//
//		self.loader = OAuth2DataLoader(oauth2: oauth2)
//		self.loader?.perform(request: req) { response in
//			do {
//				let dict = try response.responseJSON()
//				DispatchQueue.main.async {
//					print(dict)
//				}
//			}
//			catch let error {
//				DispatchQueue.main.async {
//					print(error)
//				}
//			}
//		}
//	}
}
