//

import Foundation
import AppKit

class LabelCollectionViewItemView: NSView {

	override func updateLayer() {
        layer!.backgroundColor = NSColor.lightGray.cgColor
	}

	// MARK: init

    func setup() {
        wantsLayer = true
        layer?.masksToBounds = true
    }

	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
        setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
}
