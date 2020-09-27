//
//  ViewController.swift
//  Basis Assignment
//
//  Created by Abdul chaudhary on 26/09/20.
//

import UIKit
import CardSlider


struct Item:CardSliderItem {
    var countLabel: String?
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

class ViewController: UIViewController, CardSliderDataSource {
    
    @IBOutlet weak var noDataView: UIView!
    var remoteData:ArrayData?
    var cardData = [Item]()
    @IBOutlet weak var demoTwoButton: UIButton!
    @IBOutlet weak var demoOneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        noDataView.isHidden = true
    }
    
    // Setting up the data
    func setUp() {
        var item = Item(countLabel:"", image: UIImage(named: "wall")!, title: "",subtitle:"",description: "")
        for i in 0..<(remoteData?.data.count ?? 0) {
            item.title = remoteData?.data[i].text ?? ""
            item.description = remoteData?.data[i].text ?? ""
            item.subtitle = remoteData?.data[i].id ?? ""
            item.countLabel = remoteData?.data[i].id ?? "0"
            cardData.append(item)
        }
    }
    
    // CardSliderItem for the card at given index, counting from the top.
    func item(for index: Int) -> CardSliderItem {
        return cardData[index]
    }
    
    // Total number of cards.
    func numberOfItems() -> Int {
        return self.remoteData?.data.count ?? 0
    }
    
    @IBAction func alert(_ sender: Any) {
        // Present the Card Slider
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Basis"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func demoTwo(_ sender: Any) {
        // Present the second Demo View
        let vc = DemoTwoViewController()
        vc.title = "Basis"
        present(vc, animated: true)
    }
    
    // MARK: - Fetching Data from API
    func getData() {
        let jsonUrl = "https://gist.githubusercontent.com/anishbajpai014/d482191cb4fff429333c5ec64b38c197/raw/b11f56c3177a9ddc6649288c80a004e7df41e3b9/HiringTask.json"
        guard let url = URL(string: jsonUrl) else
        { return }
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            // Normalize invalid json data
            if let data = data {
                guard let stringRepresentation = String(data: data, encoding: .utf8) else { return }
                let validJSONString = stringRepresentation.dropFirst()
                print(validJSONString)
                guard let de = validJSONString.data(using: .utf8) else { return }
                //Success
                do {
                    self.remoteData = try JSONDecoder().decode(ArrayData.self, from: de)
                    DispatchQueue.main.async {
                        self.setUp()
                    }
                } catch let jsonError {
                    self.alertDialog()
                    print("Failure!",jsonError)
                }
                
            } else {
                DispatchQueue.main.async {
                    self.noDataView.isHidden = false
                    self.demoOneButton.isHidden = true
                    self.demoTwoButton.isHidden = true
                    print("Data not found!")
                }
            }
            //ERROR
            if let error = error {
                print("Failure!",error)
                return
            }
        }.resume()
    }
    
    func alertDialog() {
        let alert = UIAlertController(title: "Error", message: "Opps! something went wrong.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

