//
//  CustomTableViewController.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/28.
//

import UIKit
class CustomTableViewController: UITableViewController {
    
    var todo = ToDoInformation() {
        didSet {    //변수가 달라짐 감지
            tableView.reloadData()
            print("DidSet 실행?")
        }
    }
    
    //액션 연결 안됨 - 텍스트필드로 구성되어 특성 활용 가능
    @IBOutlet var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90    // 항상 똑같은 높이 줄 때 사용
        searchBar.placeholder = "할일을 입력해주세요"
        
        //텍스트필드 특성 가져와서 액션 만들어주기
        searchBar.searchTextField.addTarget(self, action: #selector(searchBarReturnTapped), for: .editingDidEndOnExit)
    }
    
    @objc func searchBarReturnTapped() {
        
        let data = ToDo(main: searchBar.text!, sub: "23.08.01", like: false, done: false)
        
        //todo 배열 추가 - 뒤에 추가 : append / 앞에 추가 : insert
//        todo.list.append(data)
        todo.list.insert(data, at: 0)
        
        //데이터 갱신
        searchBar.text = ""
//        tableView.reloadData()
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //타입 캐스팅, cell과 CustomTableViewCell 연결
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        
        let row = todo.list[indexPath.row]
        cell.configureCell(row: row)
        
        //버튼 클릭을 위한 태그 부여 -> IBAction으로 연결하면 하나 클릭하면 모든 버튼이 클릭됨(복사붙여넣기 하기 때문에)
        cell.starButton.tag = indexPath.row
        
        //코드로 액션 만들기
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        
        
        
        return cell
    }
    
    //함수 호출 시 매개변수 안 넣어도 되게 내부적으로 구현되어있음 @objc 여기에
    @objc func starButtonClicked(_ sender: UIButton) {
        
        //indexPath를 tag에 넣어서 이렇게 호출 가능
        todo.list[sender.tag].like.toggle()
//        tableView.reloadData()
    }
    
    
    
    
    //셀 선택
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    //삭제하기 활성화
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //제거 -> 갱신
        todo.list.remove(at: indexPath.row)
//        tableView.reloadData()
    }
    
}
