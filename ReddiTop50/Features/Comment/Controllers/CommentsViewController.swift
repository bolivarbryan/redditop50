//
//  CommentsViewController.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/3/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
   var postViewModel: PostViewModel?

   @IBOutlet weak var commentsTableView: UITableView!

   override func viewDidLoad() {
      super.viewDidLoad()
      title = postViewModel?.title
      commentsTableView.dataSource = self
      commentsTableView.delegate = self
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

extension CommentsViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cellIdentifier = "CommentCellIdentifier"
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CommentTableViewCell
      cell.delegate = self
      cell.setup()
      return cell
   }
}

extension CommentsViewController: UITableViewDelegate {

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 10
   }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //call to itself
      let storyboard =  UIStoryboard(name: "CommentsStoryboard", bundle: nil)
      let vc = storyboard.instantiateViewController(withIdentifier: "CommentsViewController")
      self.navigationController?.pushViewController(vc, animated: true)
   }
}

extension CommentsViewController: CommentTableViewCellDelegate {
   func userProfileSelected(userName: String) {
      performSegue(withIdentifier: "profileSegue", sender: self)
   }
}
