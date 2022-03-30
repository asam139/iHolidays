//
//  HolidayTableViewCell.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit

class HolidayTableViewCell: UITableViewCell {
    struct Model {
        let imageURL: URL?
        let name: String?
    }

    // MARK: Stored properties
    private let randomImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        img.tintColor = .secondaryLabel
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
        randomImageView.image = nil
        nameLabel.text = ""
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        if animated {
            UIView.animate(withDuration: animated ? 0.3 : 0) {
                self.backgroundColor = highlighted ? .systemBlue : .clear
            }
        } else {
            backgroundColor = highlighted ? .systemBlue : .clear
        }
    }

    private func setUp() {
        contentView.addSubview(randomImageView)
        contentView.addSubview(nameLabel)

        randomImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        randomImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        randomImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        randomImageView.widthAnchor.constraint(equalTo: randomImageView.heightAnchor).isActive = true

        nameLabel.leadingAnchor.constraint(equalTo: randomImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    func update(model: Model) {
        randomImageView.sd_setImage(with: model.imageURL, placeholderImage: UIImage(systemName: "photo"))
        nameLabel.text = model.name
    }
}
