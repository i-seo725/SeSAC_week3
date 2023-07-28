//
//  CustomTableViewCell.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/28.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    @IBOutlet var backView: UIView!
    @IBOutlet var checkboxImageView: UIImageView!
    
    @IBOutlet var mainTitleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    
    func configureCell(row: ToDo) {
        mainTitleLabel.text = row.main
        subTitleLabel.text = row.sub
        
        checkboxImageView.image = row.done == true ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
                
        if row.like {
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            starButton.setImage(UIImage(systemName: "star"), for: .normal)

        }
    }
    
}
