//
//  PostTableViewCell.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit

protocol PostTableViewCellDelegate: class {
   func willShowComments(viewModel: PostViewModel)
}

class PostTableViewCell: UITableViewCell {

   enum CellType {
      case thumbnail
      case simple
   }

   var viewModel: PostViewModel!
   var cellType: CellType = .simple
   var delegate: PostTableViewCellDelegate?

   @IBOutlet fileprivate weak var authorLabel: UILabel!
   @IBOutlet fileprivate weak var timeAgoLabel: UILabel?
   @IBOutlet fileprivate weak var titleLabel: UILabel?
   @IBOutlet fileprivate weak var commentsButton: UIButton!
   @IBOutlet fileprivate weak var thumbnailWidthConstraint: NSLayoutConstraint?
   @IBOutlet fileprivate weak var thumbnailTrailingConstraint: NSLayoutConstraint?
   @IBOutlet weak var postImageView: UIImageView!
   @IBOutlet weak var thumbnailImageView: UIImageView?

   override func awakeFromNib() {
      super.awakeFromNib()
   }

   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }

   func setupCell() {
      authorLabel.text = viewModel.authorNameString
      timeAgoLabel?.text = viewModel.timeAgo
      titleLabel?.text = viewModel.title
      switch viewModel.postType {
      case .simple:
         thumbnailWidthConstraint?.constant = 0
         thumbnailTrailingConstraint?.constant = 0
      case .image:
         thumbnailWidthConstraint?.constant = 0
         thumbnailTrailingConstraint?.constant = 0
          authorLabel.text = viewModel.authorNameString + " • " + viewModel.timeAgo
      case .thumbnailed:
         thumbnailWidthConstraint?.constant = 60
         thumbnailTrailingConstraint?.constant = 10
      }
      layoutIfNeeded()
   }

   @IBAction func showComments(_ sender: Any) {
      delegate?.willShowComments(viewModel: viewModel)
   }
}
