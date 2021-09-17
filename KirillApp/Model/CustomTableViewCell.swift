//
//  CustomTableViewCell.swift
//  KirillApp
//
//  Created by кирилл ларионов on 02.09.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let nameCity = UILabel()
    let tempCityLabel = UILabel()

    func configure(weather:Weather) {
        self.nameCity.text = weather.name
        self.tempCityLabel.text = weather.temperatureString + "°C"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        nameCity.translatesAutoresizingMaskIntoConstraints = false
        tempCityLabel.translatesAutoresizingMaskIntoConstraints = false
        
  
        contentView.addSubview(nameCity)
        contentView.addSubview(tempCityLabel)
       
        
        //Connstraints
        NSLayoutConstraint.activate([
            nameCity.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            nameCity.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            nameCity.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            nameCity.heightAnchor.constraint(equalToConstant: 50),
            
            NSLayoutConstraint(item: tempCityLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 5.0),
            tempCityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            tempCityLabel.heightAnchor.constraint(equalToConstant: 50)
            
//            cityTemperature.leadingAnchor.constraint(equalTo: cityName.leadingAnchor, constant: 0),
//            cityTemperature.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            ])
         
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

 
