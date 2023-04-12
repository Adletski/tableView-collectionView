//
//  NewEmojiTableViewController.swift
//  collections app TableView+CollectionView
//
//  Created by Adlet Zhantassov on 12.04.2023.
//

import UIKit
import SnapKit

class NewEmojiTableViewController: UITableViewController {
    
    var completion: ((String, String, String) -> ())?
    
    let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTapped))
    
    lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "EMOJI"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "DESCRIPTION"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    lazy var emojiTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var nameTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var descriptionTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New emoji"
        view.backgroundColor = .systemGray5
        tableView.isScrollEnabled = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        saveButton.isEnabled = false
        navigationItem.rightBarButtonItem = saveButton
        descriptionTF.delegate = self
        setupViews()
    }

    // MARK: - Table view data source
    private func setupViews() {
        view.addSubview(emojiLabel)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emojiTF)
        view.addSubview(nameTF)
        view.addSubview(descriptionTF)
        setupConstraints()
    }
    
    private func setupConstraints() {
        emojiLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.snp.leading).offset(20)
        }
        
        emojiTF.snp.makeConstraints { make in
            make.top.equalTo(emojiLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(30)
            
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(emojiTF.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
        }
        
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(30)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTF.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
        }
        
        descriptionTF.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(30)
        }
    }
    
    @objc
    func cancelTapped() {
        print("asd")
        dismiss(animated: true)
    }
    
    @objc
    func saveTapped() {
        completion?(nameTF.text!, emojiTF.text!, descriptionTF.text!)
        dismiss(animated: true)
    }
    

}

extension NewEmojiTableViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var dTF = self.descriptionTF.text
        var eTF = self.emojiTF.text
        var nTF = self.nameTF.text
        
        switch textField {
        case self.descriptionTF:
            dTF = string
        case self.nameTF:
            nTF = string
        case self.emojiTF:
            eTF = string
        default:
            break
        }
        
        if dTF != "" && eTF != "" && nTF != "" {
            saveButton.isEnabled = true
        }
        
        return true
        }
        
    }

