//
//  ViewController.swift
//  Basis Assignment
//
//  Created by Abdul chaudhary on 26/09/20.
//

import UIKit
import CardSlider


struct Item:CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

class ViewController: UIViewController, CardSliderDataSource {
   
    
    var data = [Item]()
    @IBOutlet weak var button: UIButton!
    
    @IBAction func alert(_ sender: Any) {
        // Present the Card Slider
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Basis"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append(Item(image: UIImage(named: "wall")!,
                         rating: nil,
                         title: "Hello World!!!",
                         subtitle: "Hello",
                         description: "Hey theere what's up?"))
        
        data.append(Item(image: UIImage(named: "wall2")!,
                         rating: nil,
                         title: "Hello World!!!",
                         subtitle: "Hello",
                         description: "Hey theere what's up?"))
        data.append(Item(image: UIImage(named: "wall3")!,
                         rating: nil,
                         title: "Hello World!!!",
                         subtitle: "Hello",
                         description: "Hey theere what's up?"))
        data.append(Item(image: UIImage(named: "wall4")!,
                         rating: nil,
                         title: "Hello World!!!",
                         subtitle: "Hello",
                         description: "Hey theere what's up?"))
        
        
      
    }

    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    
    func numberOfItems() -> Int {
        return data.count
    }
    

}

