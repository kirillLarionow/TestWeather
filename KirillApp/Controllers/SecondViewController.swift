//
//  SecondViewController.swift
//  KirillApp
//
//  Created by кирилл ларионов on 02.09.2021.
//

import UIKit
class SecondViewController: UIViewController{
    let namedLabel = UILabel()
    let conditionLabel = UILabel()
    let conditionLabelPrevious = UILabel()
    let tempLabel = UILabel()
    let tempYesterdayLabel = UILabel()
    let tempTomorrowLabel = UILabel()
    var weatherModel:Weather?
    var weatherDay: WeatherData?
    override func viewDidLoad() {
        super.viewDidLoad()
        namedLabel.frame = CGRect(x: 0, y: 0, width: 374, height: 45)
        namedLabel.text = weatherModel?.name
        namedLabel.font = UIFont.systemFont(ofSize: 40.0)
        namedLabel.adjustsFontSizeToFitWidth = true
        namedLabel.textAlignment = .center
        conditionLabel.frame = CGRect(x: 0, y: 0, width: 374, height: 45)
        conditionLabel.text = (weatherModel?.temperatureString)! + "°C"
        conditionLabel.font = UIFont.systemFont(ofSize: 20.0)
        conditionLabel.adjustsFontSizeToFitWidth = true
        conditionLabel.textAlignment = .center
        tempLabel.frame = CGRect(x: 0, y: 0, width: 374, height: 45)
        tempLabel.text = weatherModel?.conditionString
        tempLabel.font = UIFont.systemFont(ofSize: 40.0)
        tempLabel.adjustsFontSizeToFitWidth = true
        tempLabel.textAlignment = .center
        tempYesterdayLabel.frame = CGRect(x: 0, y: 0, width: 374, height: 45)
        tempYesterdayLabel.text = (weatherModel?.temperatureYesterdayString)! + "°C - Yesterday"
        tempYesterdayLabel.font = UIFont.systemFont(ofSize: 20.0)
        tempYesterdayLabel.adjustsFontSizeToFitWidth = true
        tempYesterdayLabel.textAlignment = .center
        tempTomorrowLabel.frame = CGRect(x: 0, y: 0, width: 374, height: 45)
        tempTomorrowLabel.text = (weatherModel?.temperatureTomorrowString)! + "°C - Tomorrow"
        tempTomorrowLabel.font = UIFont.systemFont(ofSize: 20.0)
        tempTomorrowLabel.adjustsFontSizeToFitWidth = true
        tempTomorrowLabel.textAlignment = .center
        view.addSubview(namedLabel)
        view.addSubview(conditionLabel)
        view.addSubview(tempYesterdayLabel)
        view.addSubview(tempTomorrowLabel)
        view.addSubview(tempLabel)
        view.backgroundColor = .white
        namedLabel.translatesAutoresizingMaskIntoConstraints = false
        namedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        namedLabel.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 0.0).isActive = true
        namedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        namedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        conditionLabel.topAnchor.constraint(equalTo: namedLabel.topAnchor, constant: 100.0).isActive = true
        conditionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        conditionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        conditionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 130.0).isActive = true
        tempYesterdayLabel.translatesAutoresizingMaskIntoConstraints = false
        tempYesterdayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempYesterdayLabel.topAnchor.constraint(equalTo: namedLabel.topAnchor, constant: 200.0).isActive = true
        tempYesterdayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        tempYesterdayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        tempYesterdayLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 230.0).isActive = true
        tempYesterdayLabel.translatesAutoresizingMaskIntoConstraints = false
        tempTomorrowLabel.translatesAutoresizingMaskIntoConstraints = false
        tempTomorrowLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempTomorrowLabel.topAnchor.constraint(equalTo: namedLabel.topAnchor, constant: 300.0).isActive = true
        tempTomorrowLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        tempTomorrowLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        tempTomorrowLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 330.0).isActive = true
        tempTomorrowLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tempLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        conditionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
    }
}

extension UIView {
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
}
