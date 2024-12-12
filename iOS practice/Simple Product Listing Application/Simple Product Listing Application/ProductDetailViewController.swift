//
//  ProductDetailViewController.swift
//  Simple Product Listing Application
//
//  Created by patururamesh on 30/09/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    private let product: Product
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = product.name
        
        view.addSubview(productImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        
        nameLabel.text = product.name
        descriptionLabel.text = product.description
        productImageView.loadImage(from: product.featuredImage)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productImageView.frame = CGRect(x: 10, y: 100, width: view.frame.size.width - 20, height: 200)
        nameLabel.frame = CGRect(x: 10, y: 310, width: view.frame.size.width - 20, height: 30)
        descriptionLabel.frame = CGRect(x: 10, y: 350, width: view.frame.size.width - 20, height: 100)
    }
}
