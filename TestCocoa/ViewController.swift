//
//  ViewController.swift
//  TestCocoa
//
//  Created by user on 03.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var newsTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private var model: [Articles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(newsTableView)
        newsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            
        }
        
        URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-11-14&sortBy=publishedAt&apiKey=e5e338add27e4ef88f26cd5a8b1af310")!) { data, response, error in
            if let data = data {
                do {
                    self.model = (try JSONDecoder().decode(News.self, from: data)).article
                    DispatchQueue.main.async {
                        
                        self.newsTableView.reloadData()
                    }
                   
                } catch {
                    
                }
            }
            
        }.resume()
       
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsCell()
        cell.fill(model: model[indexPath.row])
        return cell
    }
}


