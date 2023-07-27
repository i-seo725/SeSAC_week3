//
//  StudyTableViewController.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/27.
//

import UIKit

class StudyTableViewController: UITableViewController {

    let studyList = ["변수", "상수", "열거형", "구조체", "클래스", "메서드", "프로퍼티"]
    let appleList = ["아이폰", "애플워치", "아이패드", "맥북", "에어팟", "애플태그", "애플티비"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        
    }

    //섹션 개수 지정, 안 하면 디폴트 1개
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "첫번째 섹션" : "두번째 섹션"
    }
    
    //1. 셀의 개수 (필수)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? studyList.count : appleList.count
    }
    
    
    //2. 셀 디자인 & 데이터 처리 (필수)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //identifier에 맞는 셀이 없을 수 있어서 옵셔널로 반환 > 해제 필요
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")!
        cell.textLabel?.text = studyList[indexPath.row]
        
        if indexPath.section == 0 {
            cell.textLabel?.text = studyList[indexPath.row]
        } else {
            cell.textLabel?.text = appleList[indexPath.row]
        }
        
        return cell
    }
    
    //3. 셀 높이 : 서비스 구현에 따라 필요한 경우가 많으나 항상 같은 높이를 사용할 경우 비효율적일 수 있음
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
    
}
