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

struct Forecast:Decodable {
    let parts:Parts
    
}
struct Parts:Decodable {
    let day:Day
    
}
struct Day:Decodable {
    
}
