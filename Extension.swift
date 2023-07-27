//
//  Extension.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/27.
//

import UIKit

//UITableViewController 어디서든 쓸 수 있는 기능 만들기
extension UITableViewController {
    func showAlert() {
        let alert = UIAlertController(title: "타이틀", message: "내용", preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}


extension UILabel {
    func configureTitleText() {
        self.textColor = .purple
        self.font = .boldSystemFont(ofSize: 20)
        self.textAlignment = .center
    }
}
