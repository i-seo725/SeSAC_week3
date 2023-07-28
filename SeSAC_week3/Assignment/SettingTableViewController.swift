//
//  SettingTableViewController.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/27.
//

import UIKit

class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    let sectionTitle = ["전체 설정", "개인 설정", "기타"]
    let cellTitle = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
//        sectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 0...sectionTitle.count - 1 {
            if section == i {
                return sectionTitle[i]
            } else { print("섹션 제목 생성 시 오류 발생")}
        }
        return "오류 발생"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for i in 0...cellTitle.count - 1 {
            if section == i {
                return cellTitle[i].count
            } else { print("셀 생성 시 오류 발생") }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        for i in 0...sectionTitle.count - 1 {
            if indexPath.section == i {
                cell.textLabel?.text = cellTitle[i][indexPath.row]
                return cell
            } else { print("셀 제목 생성 시 오류 발생")}
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
