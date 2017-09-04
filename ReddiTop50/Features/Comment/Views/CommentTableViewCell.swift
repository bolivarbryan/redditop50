//
//  CommentTableViewCell.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/4/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit

protocol CommentTableViewCellDelegate {
   func userProfileSelected(userName: String)
}

class CommentTableViewCell: UITableViewCell {

   @IBOutlet weak var bodyLabel: UILabel!
   @IBOutlet weak var commentsCountLabel: UILabel!
   @IBOutlet weak var userButton: UIButton!
   var delegate: CommentTableViewCellDelegate?

   override func awakeFromNib() {
      super.awakeFromNib()
   }

   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }

   func setup() {
      userButton.setTitle("juanchopolo", for: .normal)
      commentsCountLabel.text = "0 count"
      bodyLabel.text = "Lorem Ipsum es un texto de marcador de posición comúnmente utilizado en las industrias gráficas, gráficas y editoriales para previsualizar diseños y maquetas"
   }

   @IBAction func showUserProfile(_ sender: Any) {
      if let delegate = delegate {
         delegate.userProfileSelected(userName: "")
      }
   }
}
