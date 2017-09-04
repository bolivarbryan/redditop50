//
//  PostListViewController.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController {

   fileprivate enum SegueIdentifier: String {
      case image = "imageSegue"
      case web = "webSegue"
      case comment = "commentsSegue"
      case profile = "profileSegue"
   }

   fileprivate let viewModel = PostListViewModel()
   @IBOutlet fileprivate weak var postListTableView: UITableView!
   var selectedPost: PostViewModel?
   //MARK: - View Life cycle

   override func viewDidLoad() {
      super.viewDidLoad()
      postListTableView.delegate = self
      postListTableView.dataSource = self
      postListTableView.estimatedRowHeight = 230
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   }

   //MARK: - Segue

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let identifier = segue.identifier else {
         return
      }
      let s = SegueIdentifier(rawValue: identifier) ?? .comment
      switch s {
      case .comment:
         break
      case .image:
         let vc = segue.destination as! PostImageViewController
         vc.viewModel = selectedPost
      case .web:
         break
      case .profile:
      break
      }
   }
}

extension PostListViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let postViewModel = viewModel.postAtIndex(index: indexPath.row)
      var cellIdentifier = "postCellIdentifier"
      if postViewModel.postType == .image {
         cellIdentifier = "postWithImageCellIdentifier"
      }
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PostTableViewCell
      cell.viewModel = postViewModel
      cell.delegate = self
      cell.setupCell()
      return cell
   }
}

extension PostListViewController: UITableViewDelegate {

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.numberOfPosts
   }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      selectedPost = viewModel.postAtIndex(index: indexPath.row)

      switch selectedPost!.postType {
      case .simple:
         performSegue(withIdentifier: SegueIdentifier.comment.rawValue, sender: self)
      case .thumbnailed:
         performSegue(withIdentifier: SegueIdentifier.web.rawValue, sender: self)
      case .image:
         performSegue(withIdentifier: SegueIdentifier.image.rawValue, sender: self)
      }
   }
}

extension PostListViewController: PostTableViewCellDelegate {
   func willShowComments(viewModel: PostViewModel) {
      selectedPost = viewModel
      performSegue(withIdentifier: SegueIdentifier.comment.rawValue, sender: self)
   }
}



