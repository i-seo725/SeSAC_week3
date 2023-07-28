//
//  CustomTableViewController.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/28.
//

import UIKit
class CustomTableViewController: UITableViewController {
    
    let todo = ToDoInformation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90    // 항상 똑같은 높이 줄 때 사용
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //타입 캐스팅, cell과 CustomTableViewCell 연결
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        
        let row = todo.list[indexPath.row]
        cell.configureCell(row: row)
        
        return cell
    }
    
    //셀 선택
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
