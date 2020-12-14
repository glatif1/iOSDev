//
//  ViewController.swift
//  MVCTableView
//
//  Created by Ghufran Latif  on 12/10/20.
//

import UIKit
import SDWebImage


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataProviderProtocol {

    
 

//    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var theTableView: UITableView!
    
    var dataArray: [photo]? = [photo]()
    var error: Error?
    

    let dp = DataProvider()
    
    func photoDataFromProvider(data: [photo]?, error: Error?) {
        //update the variables
        self.dataArray = data
        self.error = error
        DispatchQueue.main.async {
            self.theTableView.reloadData()
        }
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dp.dataProviderProtocol = self
        // Do any additional setup after loading the view.\
       fetchData()

        theTableView.delegate = self
        theTableView.dataSource = self

    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let str = dataArray![indexPath.row].thumbnailUrl
//        cell?.backgroundColor = UIColor.blue
        cell?.textLabel?.text = "Texttteljdlsfj"
        cell?.imageView?.sd_setImage(with: URL(string: str), placeholderImage: UIImage(named: "loading"))
        return cell!

    }


    //get the data
    func fetchData(){
        dp.getDataFromCloud()
    }
}

