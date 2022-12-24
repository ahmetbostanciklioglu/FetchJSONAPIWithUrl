//
//  ViewController.swift
//  LoadDataFromJsonAPI
//
//  Created by Ahmet Bostancıklıoğlu on 25.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData { (posts) in
            for post in posts  {
                print(post.title!)
                print("\n")
            }
        }
    }

    func fetchData(completionHandler: @escaping ([Post]) -> Void) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        let _: Void = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return  }
            
            do {
                let postDataArray =  try JSONDecoder().decode([Post].self, from: data)
                
                completionHandler(postDataArray)
                
            } catch {
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
        
    }

}

