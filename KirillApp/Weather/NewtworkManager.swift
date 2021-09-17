//
//  NewtworkManager.swift
//  KirillApp
//
//  Created by кирилл ларионов on 02.09.2021.
//

import Foundation

struct NewtorkManager {
    func yandexAPI(lat:Double,lon:Double, completionHandler: @escaping (Weather) -> Void){
        let apiKey = "7358525a-964d-4c20-8018-e43ec9b733ca"
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(lat)&lon=\(lon)&limit=3"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            if let weather = self.parseJSON(withData: data){
                completionHandler(weather)
                print(weather)
            }
        }
        
        task.resume()
    }
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
}
