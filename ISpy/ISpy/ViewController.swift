//
//  ViewController.swift
//  ISpy
//
//  Created by mahika behal on 03/09/25.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
           return imageView
       }

       func updateZoomFor(size: CGSize) {
           guard let image = imageView.image else { return }
           
           let widthScale = size.width / image.size.width
           let heightScale = size.height / image.size.height
           let scale = min(widthScale, heightScale)
           
           scrollView.minimumZoomScale = scale
           scrollView.zoomScale = scale
       }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           updateZoomFor(size: view.bounds.size)
       }

}

