//
//  ViewController.swift
//  coll
//
//  Created by patururamesh on 06/08/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView!
    private let images = [UIImage(named: "Car1"), UIImage(named: "Car2"), UIImage(named: "Car3"),
                          UIImage(named: "Car4"), UIImage(named: "Car5"), UIImage(named: "Car6"),
    UIImage(named: "Car7")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create and configure the flow layout for horizontal scrolling
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5 // Spacing between cells

        // Initialize the collection view with the layout and a specific frame
        let collectionViewFrame = CGRect(x: 30, y: 100, width: 300, height: 200) // Custom frame
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false

        // Register a custom cell class
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")

        // Set the data source and delegate
        collectionView.dataSource = self
        collectionView.delegate = self

        // Add the collection view to the view hierarchy
        view.addSubview(collectionView)
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = images[indexPath.item]
        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Define cell width and height
        let cellWidth = collectionView.frame.size.width / 2 - 15 // Example width
        let cellHeight = collectionView.frame.size.height - 20 // Example height
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// Custom UICollectionViewCell for images
class ImageCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)

        // Set up constraints for imageView
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
