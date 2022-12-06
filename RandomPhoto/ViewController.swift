//
//  ViewController.swift
//  RandomPhoto
//
//  Created by awoisoak on 6/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemCyan
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        view.addSubview(imageView)
        imageView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: view.frame.size.height
        )
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 80,
            y: view.frame.size.height-50-view.safeAreaInsets.bottom,
            width: view.frame.size.width-160,
            height: 50
        )
    }

    
    func getRandomPhoto(){
        let array = [
            "https://awoisoak.com/wp-content/uploads/2022/05/dsc07127-447.jpg",
            "https://awoisoak.com/wp-content/uploads/2021/03/pano0001-pano-edit-3.jpg",
            "https://awoisoak.com/wp-content/uploads/2022/07/dsc08840-518-520.jpg",
            "https://awoisoak.com/wp-content/uploads/2019/12/dsc07507-137-23.jpg",
            "https://awoisoak.com/wp-content/uploads/2019/08/tokyo-roof-6.jpg",
            "https://awoisoak.com/wp-content/uploads/2020/04/hozujan-risshaku-temple-10.jpg",
            "http://awoisoak.com/wp-content/uploads/2018/01/dsc09066_lzn.jpg"
        ]
        let urlString = array.randomElement()!
        let url = URL(string: urlString)!
        downloadPhoto(url: url)
    }
    
    
    func downloadPhoto(url:URL) {
        // Create Data Task
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self?.imageView.image = UIImage(data: data)
                }
            }
        }

        // Start Data Task
        dataTask.resume()
    }
}

