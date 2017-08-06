//
//  DisplayNotesViewController.swift
//  notebook
//
//  Created by Morikawa Gento on 2017/08/06.
//  Copyright © 2017年 gentom. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {

    @IBOutlet weak var noteContentTextView: UITextView!
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        noteTitleTextField.text = ""
        noteContentTextView.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            } else if identifier == "save" {
                print("Save button tapped")
                
                // Noteインスタンス生成
                let note = Note()
                // ??は Nil Coalescing演算子。 オブジェクトがnilの場合はデフォルト値。
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                
                /*
                Segueクラス UIStoryBoardSegueはsourceViewControllerプロパティと
                destinationViewControllerプロパティを使用して、sourceView,destinationViewの
                両方にアクセスする。
                ここでは、destinationViewControllerプロパティを使用して、
                NotesTableViewControllerへの参照を取得している。
                */
                let NotesTableViewController = segue.destination as! NotesTableViewController
                // 新しいnoteをnotes配列に追加
                NotesTableViewController.notes.append(note)
            }
        }
    }
    
    
}
