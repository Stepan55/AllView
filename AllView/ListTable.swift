//
//  ListTable.swift
//  AllView
//
//  Created by Степан on 16.01.2023.
//

import UIKit

class ListTable: UITableViewController {
    
    var deathEmoji: Emoji = Emoji(emoji: "☠️", name: "Death", explain: "Bones", isLike: false)
    
    var objects = [
        Emoji(emoji: "💩", name: "Poop", explain: "Nasty", isLike: false),
        Emoji(emoji: "🤡", name: "Clown", explain: "Make fun", isLike: false),
        Emoji(emoji: "👽", name: "UFO", explain: "Zone 51", isLike: false)

    ]
    
    var num = 0
    var num2 = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "List"
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem?.tintColor = .systemPink
        
        self.tableView.rowHeight = 75   /// в высоту каждый столбец

    }

    // MARK: - Table view data source

    ///     КОЛ-ВО СЕКЦИЙ
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    ///     СОЗДАЕТ КОЛ-ВО РЯДОВ В ОДНОЙ СЕКЦИИ
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableSmileID", for: indexPath) as! EmojiCellTableViewCell

        let object = objects[indexPath.row]
        cell.set(obj: object)
        return cell
    }
    
    ///     Чередуются УДАЛЕНИЕ и ВСТАВКА
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        if indexPath.row % 2 == 0 { // нумерация indexPath идет с --> 0 как массив 0 % 2 = 0; 1 % 2 = 1; 2 % 2 = 0 --> (0, 1, 0) -> (insert delete insert)
            return .insert
        } else {
            return .delete
        }
    }
    
    ///  подсчитывает в консоли кол-во раз кликов нажатия на DELETE и INSERT
    /// также удаляет и вставляет
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            num += 1
            print("delete (\(num))")
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else {
            num2 += 1
            print("insert (\(num2))")
            objects.insert(deathEmoji, at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .fade)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    /// ПЕРЕМЕЩЕНИЕ
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let move = objects.remove(at: sourceIndexPath.row)
        objects.insert(move, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
}
