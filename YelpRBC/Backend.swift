//
//  backend.swift
//  YelpRBC
//
//  Created by Reid Ellis on 2016-10-10.
//  Copyright © 2016 Tnir Technologies. All rights reserved.
//

import Foundation
import Alamofire

class Backend {

	fileprivate	static let apiKey = "v1KQWvOJli4Y69nvfBr4DQ"
	fileprivate	static let secret = "acNRn4t246u2CWRR3EzG4US38ApoyaRcWb7ouVFXwFwNaYZI4uLz59G4Atz0uMdU"
	fileprivate static let apiTokenUrlString = "https://api.yelp.com/oauth2/token"
	fileprivate	static let apiUrlString = "https://api.yelp.com/v3/"
	fileprivate static let searchString = "businesses/search/"

	var tokenString : String? = nil
	let urlString = "https://api.yelp.com/v3/businesses/search"

	open func load() {
		// the token string returned by the Yelp OAuth server for our client id and secret

		// get the OAuth token, valid for 3 months
		let req = request("https://api.yelp.com/oauth2/token",
		                  method: .post,
		                  parameters: ["client_id":		Backend.apiKey,
		                               "client_secret":	Backend.secret,
		                               "grant_type":	"client_credentials"],
		                  encoding: URLEncoding.httpBody)
		

		// try to parse the response as JSON data
		req .responseString(completionHandler: { (response) in
				print(response)
			})

			.responseJSON { (response) in
				print(response.request)  // original URL request
				print(response.response) // HTTP URL response
				print(response.data)     // server data
				print(response.result)   // result of response serialization

				if let JSON = response.result.value {
					print("JSON: \(JSON)")
					if let dict = JSON as? Dictionary<String, AnyObject> {
						self.tokenString = dict["access_token"] as? String
						print("access_token 1 = \(self.tokenString)")
						self.loadYelp()
					}
				}
			}
	}

	open func loadYelp() {
		print("access_token 2 = \(self.tokenString)")
		let s : String
		if self.tokenString != nil {
			s = self.tokenString!
		} else {
			s = ""
		}
		print("s is \(s)")

		// if we didn't get a token, Yelp may be unavailable
		guard let token = self.tokenString else {
			return;
		}

		// OAuth headers
		let headers: HTTPHeaders = [
			"Authorization": "Bearer \(token)"
		]

		// ask for Thai food
		request(urlString,
		        method: .get,
		        parameters: ["term": "Thai",
		                     "latitude": "43.7444648",
		                     "longitude": "-79.2026048"],
		        headers: headers
			).responseJSON { (response) in
				print(response.request)  // original URL request
				print(response.response) // HTTP URL response
				print(response.data)     // server data
				print(response.result)   // result of response serialization

				if let JSON = response.result.value {
					print("JSON: \(JSON)")
				}
		}
	}
}
