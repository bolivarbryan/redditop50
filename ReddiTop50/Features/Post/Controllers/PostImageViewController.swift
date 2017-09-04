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

      viewModel?.image?.getImage(url: image.url!.absoluteString, imageView: imageView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   @IBAction func goBack(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)
   }

   @IBAction func savetoCameraRoll(_ sender: Any) {
      guard let image = imageView.image else { return }
      UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
      let alertController = UIAlertController(title: "Success", message: "Image saved!", preferredStyle: .alert)
      let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
      alertController.addAction(action)
      self.present(alertController, animated: true, completion: nil)
   }
}
