//
//  Weather.swift
//  KirillApp
//
//  Created by кирилл ларионов on 02.09.2021.
//

import Foundation

struct Weather {
    
    var name:String = "загрузка"
    var temperature:Int = 0
    var temperatureString:String{
        return String(temperature)
    }
    var url:String = ""
    var condition:String = "" //ясно облачно
    
    var conditionString:String {
        switch condition {
        case "clear": return "Ясно"
        case "partly-cloudy": return "малооблачно"
        case "cloudy": return "облачно с прояснениями"
        case "overcast": return "пасмурно"
        case "partly-cloudy-and-light-rain": return "малооблачно, небольшой дождь."
        case "partly-cloudy-and-rain": return "малооблачно, дождь"
        case "overcast-and-rain": return "значительная облачность, сильный дождь."
        case "overcast-thunderstorms-with-rain": return "сильный дождь с грозой"
        case "cloudy-and-light-rain": return "облачно, небольшой дождь."
        case "overcast-and-light-rain": return "значительная облачность, небольшой дождь."
        case "cloudy-and-rain": return "облачно, дождь"
        case "overcast-and-wet-snow": return "дождь со снегом"
        case "partly-cloudy-and-light-snow": return "небольшой снег"
        case "partly-cloudy-and-snow": return "малооблачно, снег"
        case "overcast-and-snow ": return "снегопад"
        case "cloudy-and-light-snow": return "облачно, небольшой снег."
        case "overcast-and-light-snow": return "значительная облачность, небольшой снег"
        case "cloudy-and-snow": return "облачно, снег"
        default:
            return ""
        }
       
    }
    
    init?(weatherData:WeatherData) {
        temperature = weatherData.fact.temp
        condition = weatherData.fact.condition
        url = weatherData.info.url
         
    }
    
    init() {
        
    }
}
