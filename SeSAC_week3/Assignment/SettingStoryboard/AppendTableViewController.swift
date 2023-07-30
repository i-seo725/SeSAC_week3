//
//  AppendTableViewController.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/27.
//

import UIKit

struct MyTodo {
    let myTodo: String
    let done: Bool
    let like: Bool
}

var list = [MyTodo(myTodo: "그립톡 구매하기", done: true, like: false),
MyTodo(myTodo: "사이다 구매", done: false, like: true),
MyTodo(myTodo: "아이패드 케이스 최저가 찾기", done: false, like: true),
MyTodo(myTodo: "양말 사기", done: true, like: false)]

class AppendTableViewController: UITableViewController {

    @IBOutlet var keywordTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var todoList: MyTodo
    override func viewDidLoad() {
        super.viewDidLoad()
        designSetting()
    }
    func designSetting() {
        keywordTextField.placeholder = "무엇을 구매하실 건가요?"
        keywordTextField.backgroundColor = .systemGray6
        keywordTextField.layer.cornerRadius = 15
        addButton.setTitle("추가", for: .normal)
        addButton.tintColor = .black
        addButton.layer.backgroundColor = UIColor.systemGray5.cgColor
        addButton.layer.cornerRadius = 8
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")!
        cell.textLabel?.text = list[indexPath.row]
        
        cell.imageView?.image = indexPath.row != 0 ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "checkmark.square.fill")
        return cell
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        guard let newKeyword = keywordTextField.text else {
            return
        }
        
        if newKeyword != "" {
            list.append(MyTodo(myTodo: keywordTextField.text, done: false, like: false))
            keywordTextField.text = ""
            tableView.reloadData()
        }
    }
}
