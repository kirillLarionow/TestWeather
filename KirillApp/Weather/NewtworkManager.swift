//
//  NewtworkManager.swift
//  KirillApp
//
//  Created by кирилл ларионов on 02.09.2021.
//

import Foundation
import Alamofire
struct NewtorkManager {
    func parseJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
            }
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }

    func yandexAPI(lat:Double,lon:Double, completionHandler: @escaping (Weather) -> Void){
        let urlString = "https://api.weather.yandex.ru/v2/forecast?"
        let header: HTTPHeaders = ["X-Yandex-API-Key": "7358525a-964d-4c20-8018-e43ec9b733ca", "Content-Type": "application/raw"]
        let limit = 3
        
        let param: [String: String] = [
            "lat": String(lat),
            "lon": String(lon),
            "limit": String(limit)
        ]
        AF.request(urlString, method: .get, parameters: param, headers: header).response { (response) in
            switch response.result {
            case .success(let value):
                if let weather = self.parseJSON(withData: value!){
                    completionHandler(weather)
                    print(weather)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


