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
    
    
    var remoteData:ArrayData?
    var cardData = [Item]()
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
        
        getCardData()
        
    }
    
    func setUp() {
        
    }
    
    // return the card index
    func item(for index: Int) -> CardSliderItem {
        return cardData[index]
    }
    
    // return the size of the data
    func numberOfItems() -> Int {
        return cardData.count
    }
    
    // MARK: - Fetching Data from API
    fileprivate func getCardData() {
        let jsonUrl = "https://gist.githubusercontent.com/anishbajpai014/d482191cb4fff429333c5ec64b38c197/raw/b11f56c3177a9ddc6649288c80a004e7df41e3b9/HiringTask.json"
        guard let url = URL(string: jsonUrl) else
        { return }
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            
            // Normalize invalid json data
            if let data = data {
                guard let stringRepresentation = String(data: data, encoding: .utf8) else { return }
                let validJSONString = stringRepresentation.dropFirst()
                print(validJSONString)
                let de = validJSONString.data(using: .utf8)
                //Success
                do {
                    self.remoteData = try JSONDecoder().decode(ArrayData.self, from: de!)
                    //print(self.remoteData.count)
                } catch let jsonError {
                    print("Failure!",jsonError)
                }
                
            }
            //ERROR
            if let error = error {
                print("Failure!",error)
                return
            }
        }.resume()
    }
    
    
    func normalizeJSON(data: Data) -> Data? {
        guard let stringRepresentation = String(data: data, encoding: .utf8) else { return nil }
        
        let validJSONString = stringRepresentation.dropFirst()
        print(validJSONString)
        return validJSONString.data(using: .utf8)
    }
    
}

