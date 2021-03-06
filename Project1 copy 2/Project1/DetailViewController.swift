//
//  DetailViewController.swift
//  Project1
//
//  Created by Ильдар Нигметзянов on 15.03.2020.
//  Copyright © 2020 Ildar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var number: Int?
    var allAmount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "picture \(number!) of \(allAmount!)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }
    
    

}
