//
//  EventTableViewCell.swift
//  EventMangaerApp
//
//  Created by patururamesh on 10/08/24.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    let startTimeLabel = UILabel()
    let titleLabel = UILabel()
    let titleLabel1 = UILabel()
    let endTimeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        
        titleLabel1.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel1.textAlignment = .center
        titleLabel1.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping

        let stackView = UIStackView(arrangedSubviews: [startTimeLabel, titleLabel, titleLabel1, endTimeLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    func configure(with event: (startTime: String, title: String, title1: String, endTime: String)) {
        startTimeLabel.text = "Start Time: \(event.startTime)"
        titleLabel.text = event.title
        titleLabel1.text = event.title1
        endTimeLabel.text = "End Time: \(event.endTime)"
    }
}
