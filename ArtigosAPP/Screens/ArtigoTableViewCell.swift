//
//  ArtigoTableViewCell.swift
//  ArtigosAPP
//
//  Created by Ezequias Santos on 30/11/22.
//

import UIKit

class ArtigoTableViewCell: UITableViewCell {
    
    // MARK: - Properties

 static let indetifier = "ArtigoTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Titulo"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Descrição"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        return label
    }()

    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Autor: "
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Nome do Autor"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    private var stackTitle = UIStackView()
    private var stackDescription = UIStackView()
    private var stackAuthor = UIStackView()
    private var stackContainer = UIStackView()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.setHeight(height: 1)
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIndentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIndentifier)
        custonCell()
        setupConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func custonCell() {
        layer.cornerRadius = 6
        
        stackTitle = UIStackView(arrangedSubviews: [titleLabel])
        stackTitle.axis = .horizontal
        stackTitle.alignment = .leading
        stackTitle.spacing = 5

        stackDescription = UIStackView(arrangedSubviews: [descriptionLabel])
        stackDescription.axis = .horizontal
        stackDescription.alignment = .leading
        stackDescription.spacing = 5
        
        stackAuthor = UIStackView(arrangedSubviews: [authorNameLabel, authorLabel])
        stackAuthor.axis = .horizontal
        stackAuthor.alignment = .leading
        stackAuthor.spacing = 5

        stackContainer = UIStackView(arrangedSubviews: [stackTitle, stackDescription, stackAuthor])
        stackContainer.axis = .vertical
        stackContainer.alignment = .leading
        stackContainer.spacing = 5

        addSubview(stackContainer)
        addSubview(dividerView)
    }

    private func setupConstraint() {
        stackContainer.anchor(
            top: topAnchor,
            paddingTop: 5,
            left: leftAnchor,
            paddingLeft: 5,
            right: rightAnchor,
            paddingRight: 5
        )
        
        dividerView.anchor(
            top: stackContainer.bottomAnchor,
            paddingTop: 5,
            left: leftAnchor,
            paddingLeft: 5,
            bottom: bottomAnchor,
            paddingBottom: 5,
            right: rightAnchor,
            paddingRight: 5
        )
    }
    
}
