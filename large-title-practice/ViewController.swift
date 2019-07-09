//
//  ViewController.swift
//  large-title-practice
//
//  Created by jinsei_shima on 2019/07/08.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
//        let searchController = UISearchController.init(searchResultsController: nil)
//        self.navigationItem.searchController = searchController
//        self.navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
        
        self.navigationItem.title = "Main"
        self.navigationItem.prompt = "Main Prompt"
        
//        self.navigationController?.navigationBar.titleTextAttributes
//        self.navigationController?.navigationBar.largeTitleTextAttributes =  [
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold),
//            NSAttributedString.Key.foregroundColor : UIColor.darkText
//            ]
        
        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let rightBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: nil, action: nil)
        let leftBarButton = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: nil, action: nil)

        self.navigationItem.setRightBarButton(rightBarButton, animated: false)
        self.navigationItem.setLeftBarButton(leftBarButton, animated: false)

        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.backgroundColor = .groupTableViewBackground
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height * 2)
        scrollView.easy.layout(Edges())
        
        let button = UIButton()
        button.setTitle("Detail", for: .normal)
        button.setTitleColor(.darkText, for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        view.addSubview(button)
        button.easy.layout(Center())
        
    }

    @objc func didTap() {
        
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

class DetailViewController: UIViewController {
    override func viewDidLoad() {
        
        self.navigationItem.title = "Detail"
        self.navigationItem.prompt = "Detail Prompt"

//        self.navigationItem.largeTitleDisplayMode = .automatic
//        self.navigationController?.navigationBar.prefersLargeTitles = true

        super.viewDidLoad()
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.backgroundColor = .groupTableViewBackground
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height * 2)
        scrollView.easy.layout(Edges())

    }
}
