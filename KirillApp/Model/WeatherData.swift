//
//  WeatherData.swift
//  KirillApp
//
//  Created by кирилл ларионов on 02.09.2021.
//

import Foundation

struct WeatherData:Decodable {
    let info:Info
    let fact:Fact
    let forecasts:[Forecast]
    let yesterday:Yesterday

}
struct Info:Decodable {
    let url:String
}

struct Fact:Decodable {
    let temp:Int
    let condition:String
 
    
    enum CodingKeys:String,CodingKey {
        case temp
        case condition
    }
}

struct Yesterday:Decodable{
    let temp:Int
}



struct Forecast:Decodable {
    let date_ts: Int
}

