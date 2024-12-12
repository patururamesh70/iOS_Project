//
//  ProductCollectionViewCell.swift
//  Simple Product Listing Application
//
//  Created by patururamesh on 30/09/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 40)
        nameLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 35, width: contentView.frame.size.width - 10, height: 30)
    }
    
    func configure(with product: Product) {
        nameLabel.text = product.name
        imageView.loadImage(from: product.thumbnailImage)
    }
}
