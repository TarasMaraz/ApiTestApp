//
//  ViewController.swift
//  ApiTestApp
//
//  Created by Тарас Панин on 25.06.2021.
//

import UIKit

class ViewController: UIViewController {
    var url = "https://v2.jokeapi.dev/joke/any"
    @IBOutlet weak var firdtJokeLable: UILabel!
    @IBOutlet weak var categotyJokeLable: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       assignbackground()
    }

    func assignbackground(){
            let background = UIImage(named: "back")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
    
    @IBAction func getRandomJokeButton(_ sender: UIButton) {
        makeRequest()
    }
    
    
    
    
    
    
    
    
    
    func makeRequest() {
        activityIndicator.startAnimating()
        let request = URLRequest(url: URL(string: url)!)
        let _ = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data, let joke = try? JSONDecoder().decode(Joke.self, from: data) {
                DispatchQueue.main.async {
                    self.categotyJokeLable.text = "Category: \(String(describing: joke.category!))"
                    
                    if (joke.setup != nil) && (joke.delivery != nil) {
                        self.firdtJokeLable.text = "\(String(describing: joke.setup!)) \n ... \n\(String(describing: joke.delivery!))"
                    } else {
                        self.firdtJokeLable.text = (String(describing: joke.joke!))
                    }
                    self.activityIndicator.hidesWhenStopped = true
                   self.activityIndicator.stopAnimating()
                }
            }
        }.resume()
    }
}

