//
//  GetCityWeather.swift
//  KirillApp
//
//  Created by кирилл ларионов on 02.09.2021.
//

import Foundation
import CoreLocation


let newtorkManager = NewtorkManager()

func getCityWeather(cityArray:[String],completionHandler: @escaping (Int,Weather) -> Void) {
    for (index,item) in cityArray.enumerated() {
        
        getCoordinate(city: item) { coordinate, error in
            guard let coordinate = coordinate,error == nil else { return }
            newtorkManager.yandexAPI(lat: coordinate.latitude, lon: coordinate.longitude) { (weather) in
                completionHandler(index, weather)
            }
        }
    }
}

func getCoordinate(city:String,completion:@escaping(_ coordinate:CLLocationCoordinate2D?, _ error:Error?) -> ()) {
    CLGeocoder().geocodeAddressString(city) { (placemark,error) in
        completion(placemark?.first?.location?.coordinate,error)
    }
}
