//
//  Companies.swift
//  Ch4c3TechCompanies
//
//  Created by Candace Hicks on 10/10/16.
//  Copyright © 2016 Candace Hicks. All rights reserved.
//

import Foundation

class TechCompanies{
    
    var regions = Array<Region>()
  
    func loadFromJSONFileInBundle(fileName: String){
        
        let bundle = Bundle.main
        
        if let path = bundle.path(forResource: fileName, ofType: "json"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
// do something with the data
            parseJson(data)
}
    }

        func parseJson(_ data: Data){
            if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status=="ok"{
                if let regionsArray = root["data"] as? [Any]{
                    for regionObject in regionsArray{
                        if let regionObject = regionObject as? [String:Any]{
                            if let regionName = regionObject["region"] as? String,
                                let companyArray = regionObject["companies"] as? [Any] {
                                let region = Region(name: regionName)
                                self.regions.append(region)
                                
                                for companyObject in companyArray {
                                    if let companyObject = companyObject as? [String: Any] {
                                        if let companyName = companyObject["company"] as? String,
                                            let latitude = companyObject["lat"] as? Double,
                                            let longitude = companyObject["lon"] as? Double
                                            {
                                        
                                        let company = Company(name: companyName, lat: latitude, lon: longitude)
                                        
                                        region.companies.append(company)
                                    
                                    }
                                    }
                                }
                            }
                        }
                    }
                    }
                    }
                }
                
                
                
            }

 
