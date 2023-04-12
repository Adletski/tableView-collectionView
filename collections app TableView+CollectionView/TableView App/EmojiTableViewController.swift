//
//  TableViewController.swift
//  collections app TableView+CollectionView
//
//  Created by Adlet Zhantassov on 12.04.2023.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    //MARK: - Properties
    var objects = [
        Emoji(emoji: "😁", name: "Smile", description: "Lets smile together", isFavorite: false),
        Emoji(emoji: "🥰", name: "Love", description: "I love you", isFavorite: false),
        Emoji(emoji: "👿", name: "Evil", description: "dont come to me", isFavorite: false)
    ]
    
    //MARK: - UI Elements
    
    
    
    //MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Emoji Reader"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        tableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmojiTableViewCell else { return UITableViewCell() }
        let object = objects[indexPath.row]
        cell.set(object)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedObject, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favorite = favoriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done,favorite])
    }
    
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") { action, view, completion in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .green
        action.image = UIImage(systemName: "checkmark.circle")
        return action
    }
    
    func favoriteAction(at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favorite") { action, view, completion in
            object.isFavorite = !object.isFavorite
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isFavorite ? .purple : .gray
        action.image = UIImage(systemName: "heart")
        return action
    }
    
    @objc
    func addTapped() {
        let newVC = NewEmojiTableViewController()
        newVC.completion = { [weak self] str1, str2, str3 in
            self?.objects.append(Emoji(emoji: str2, name: str1, description: str3, isFavorite: false))
            self?.tableView.reloadData()
        }
        let NC = UINavigationController(rootViewController: newVC)
        present(NC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = NewEmojiTableViewController()
        VC.completion = { [weak self] str1, str2, str3 in
            self?.objects[indexPath.row].name = str1
            self?.objects[indexPath.row].emoji = str2
            self?.objects[indexPath.row].description = str3
            self?.tableView.reloadData()
        }
        VC.emojiTF.text = objects[indexPath.row].emoji
        VC.nameTF.text = objects[indexPath.row].name
        VC.descriptionTF.text = objects[indexPath.row].description
        let NC = UINavigationController(rootViewController: VC)
        present(NC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
