//
//  PostImageViewController.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/3/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit

class PostImageViewController: UIViewController {
   @IBOutlet weak var imageView: UIImageView!
   var viewModel: PostViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
      guard let image = viewModel?.image else {
         return
      }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   @IBAction func goBack(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)
   }

}
