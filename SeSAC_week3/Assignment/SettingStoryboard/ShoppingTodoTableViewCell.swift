//
//  ShoppingTodoTableViewCell.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/30.
//

import UIKit

class ShoppingTodoTableViewCell: UITableViewCell {

    
    @IBOutlet var checkBoxImageView: UIImageView!
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    func configCell(row: MyTodo) {
        todoLabel.text = row.myTodo
        checkBoxImageView.image = row.done == true ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        
        let likeImage = row.like == true ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        likeButton.setImage(likeImage, for: .normal)
        likeButton.setTitle("", for: .normal)
    }
    
    
    
}
