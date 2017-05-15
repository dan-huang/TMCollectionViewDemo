//
//  ViewController.swift
//  CollectionViewElCapitan
//
//  Created by Klaas on 07.10.15.
//  Copyright © 2015 Park Bench. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
	var strings = ["Peter", "Florian", "Ruediger", "John", "Paul", "George", "Ringo"].sorted()
	
    @IBOutlet weak var collectionView: NSCollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView.dataSource = self
        collectionView.collectionViewLayout = TMCollectionLayout()
	}

    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
	
	func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
		return strings.count
	}
	
	func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
		let item = collectionView.makeItem(withIdentifier: "LabelCollectionViewItem", for: indexPath)
		item.representedObject = LabelObject(title: strings[indexPath.item])
		return item
	}
}
