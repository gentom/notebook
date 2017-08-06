//
//  NotesTableViewController.swift
//  notebook
//
//  Created by Gento Morikawa on 2017/08/06.
//  Copyright © 2017年 gentom. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    /*
     notesプロパティが変更されるたびに、すべてのデータをリロードするよう
     didSetプロパティオブザーバを用いてテーブルビューに通知
    */
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // 表示すべきセルの数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    // テーブルの特定の行に対して、表示すべきcellを返す
    // indexPathは、作成するcellがデーブルビュー内のどのセクションと行に属するかを示す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //テーブルビューに表示される実際のcellをフェッチしている
        //ダウンキャスト <- NotesTableViewCellがUITableViewCellのサブクラスであるため機能する
        //コンパイラに具体的な種類のUITableViewCellを返すことを指示する
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesTableViewCell", for: indexPath) as! NotesTableViewCell
        
        // indexPathは、cellForRowに渡された引数であり、テーブルビューがセルをどの行に表示するのかを示す
        // indexPathのrowプロパティにアクセスし、検索する。
        let row = indexPath.row
        
        let note = notes[row]
        
        cell.noteTitleLabel.text = note.title
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }    
        
    @IBAction func unwindToNotesViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
}
