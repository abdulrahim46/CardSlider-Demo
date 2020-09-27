//
//  DemoTwoViewController.swift
//  Basis Assignment
//
//  Created by Abdul chaudhary on 27/09/20.
//

import Foundation
import UIKit
import iCarousel

class DemoTwoViewController: UIViewController, iCarouselDataSource {
    
    var remoteData:ArrayData?
    
    let carousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow2
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(carousel)
        getData()
    }
    
    func setUp() {
        carousel.dataSource = self
        carousel.frame = CGRect(x: 0, y: 200,
                                width: view.frame.size.width,
                                height: 400)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return remoteData?.data.count ?? 0
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 300))
        view.backgroundColor = .systemGreen
        
//        let imageView = UIImageView(frame: view.bounds)
//        view.addSubview(imageView)
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "wall2")
        var count = 0
        let label = UILabel(frame: view.bounds)
        view.addSubview(label)
        label.textColor = .white
        label.font = .italicSystemFont(ofSize: 20)
        label.numberOfLines = 5
        for _ in 0..<(remoteData?.data.count ?? 0) {
            label.text = remoteData?.data[count].text
            count += 1
            print(count)
        }
        //label.text = remoteData?.data[0].text
        
        return view
    }
    
    
    
    
    // MARK: - Fetching Data from API
    @objc fileprivate func getData() {
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
    
}
