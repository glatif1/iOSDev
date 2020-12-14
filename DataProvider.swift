//
//  DataProvider.swift
//  MVCTableView
//
//  Created by Ghufran Latif  on 12/10/20.
//

import Foundation

protocol DataProviderProtocol {
    func photoDataFromProvider(data: [photo]?, error: Error?)
}

class DataProvider {
    //singleton class
//    static sharedInstance = DataProvider.init()
//    
//    private init(){
//    }
    
    var dataProviderProtocol: DataProviderProtocol?
    func getDataFromCloud() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")

        guard let urlU = url else {return} //Unwrapped
        URLSession.shared.dataTask(with: urlU) { (data, response, error) in
            let model = try! JSONDecoder.init().decode([photo].self, from: data!)
            //send data straight to view controller sense we're using MVC structure
            self.dataProviderProtocol?.photoDataFromProvider(data: model, error: error)
        }.resume()
        
    }
}
