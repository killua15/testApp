//
//  ViewController.swift
//  TestMobile App
//
//  Created by David Lopez Salinas on 1/14/21.
//

import UIKit
import IBAnimatable
import Nuke

class ViewController: UIViewController {
    @IBOutlet weak var titleComic: AnimatableLabel!
    @IBOutlet weak var imageComic: AnimatableImageView!
    @IBOutlet weak var previousButton: AnimatableButton!
    @IBOutlet weak var nextButton: AnimatableButton!
    
    var indexPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getComic(indexPage: indexPage)
        // Do any additional setup after loading the view.
    }
    
    func getComic(indexPage:Int) -> Void {
        if indexPage >= 1 {
            HelperLoadings.shared.startLoading(parent: self)
            self.view.isUserInteractionEnabled = false
            NetworkingManager.shared.getLink(idLink: indexPage) {
                (err, success, comic) in
                if  success  {
                    if let comic = comic, let url = URL(string: "https:\(comic.urlImage)") {
                        
                        self.titleComic.text = comic.titleComic
                        
                        Nuke.loadImage(
                            with: url,options: ImageLoadingOptions(
                            placeholder: UIImage(named: "placeholder"),
                            transition: .fadeIn(duration: 0.33)
                            ),
                            into: self.imageComic,
                            progress: { _, completed, total in
                                print("progress updated")
                            },
                            completion: {_ in
                                print("progress fi")
                                HelperLoadings.shared.stopLoading()
                                self.view.isUserInteractionEnabled = true
                            })
                        
                    } else {
                        HelperLoadings.shared.stopLoading()
                        self.view.isUserInteractionEnabled = true
                    }
                    HelperLoadings.shared.stopLoading()
                    self.view.isUserInteractionEnabled = true
                } else {
                    print("error")
                    HelperLoadings.shared.stopLoading()
                    self.view.isUserInteractionEnabled = true
                }
            }
        }
        
    }
    
    @IBAction func actionPreviousButton(_ sender: Any) {
        self.indexPage = indexPage > 1 ? self.indexPage - 1 : self.indexPage
        getComic(indexPage: indexPage)
    }
    
    @IBAction func actionNextbutton(_ sender: Any) {
        self.indexPage = self.indexPage + 1
        getComic(indexPage: indexPage)
    }
}

