//
//  TodoTableViewController.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/27.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todoList = ["쇼핑하기", "영화보기", "공부하기", "잠자기", "쉬기", "밥먹기", "등산하기", "커피먹기", "수영하기", "집가기", "약속잡기", "리뷰쓰기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //1. 섹션 내 셀의 수 정하기 : 카톡 친구 수만큼 셀이 필요하다고 iOS에 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    //2. 셀의 디자인과 데이터 처리 : 카톡 프로필 모서리 둥글게, 친구별 프로필 및 상태 메시지 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        //여러 셀 중에 어떤 셀을 복붙할 건지 정하기, identifier 인터페이스 빌더에서 설정 필요
        //dequeueReusableCell 재사용 메커니즘 : 셀이 스크린에 안 보이게 되면 재활용해서 데이터만 바꿈
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        //홀수 셀과 짝수 셀의 배경 다르게 주기
        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .systemGray6
        
        //내용이 남아있어서 else 안 쓰면 첫번째~세번째 텍스트가 스크롤 넘기면 다시 나타남, 재사용 메커니즘 때문
        cell.textLabel?.text = todoList[indexPath.row]
        
        cell.textLabel?.configureTitleText()
        
        cell.detailTextLabel?.text = "디테일 텍스트"
        cell.detailTextLabel?.textColor = .systemMint
        cell.detailTextLabel?.font = .systemFont(ofSize: 15)
        
        cell.imageView?.image = UIImage(systemName: "star.fill")
        cell.imageView?.tintColor = .systemYellow
        
        return cell
    }
    
    //3. 셀 높이 : 지정하지 않을 경우 디폴트(44) 반영
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        showAlert()
        //1. 리스트에 내용 추가
        todoList.append("씻기")
        print(todoList)
        
        //2. 테이블뷰 다시 만들기(갱신)
        tableView.reloadData()
    }
    
}
