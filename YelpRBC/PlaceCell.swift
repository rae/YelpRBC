//
//  PlaceCell.swift
//  YelpRBC
//
//  Created by Reid Ellis on 2016-10-11.
//  Copyright © 2016 Tnir Technologies. All rights reserved.
//

import Foundation
import UIKit
import NFImageView
import SwiftyJSON

class PlaceCell : UITableViewCell {
	@IBOutlet var titleLabel : UILabel? = nil
	@IBOutlet var placeImageView : NFImageView? = nil
	@IBOutlet var placeTextView : UITextView? = nil
	var details: JSON? = nil
}
