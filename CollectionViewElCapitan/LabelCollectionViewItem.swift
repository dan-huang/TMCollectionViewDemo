//

import Foundation
import AppKit

class LabelObject: NSObject {
	var title:String
	
	init(title:String) {
		self.title = title
	}
}

class LabelCollectionViewItem: NSCollectionViewItem {

	var labelObject:LabelObject? {
		return representedObject as? LabelObject
	}

	@IBOutlet weak var label: NSTextField!
}

