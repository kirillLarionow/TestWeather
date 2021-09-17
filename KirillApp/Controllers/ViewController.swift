//
//  ViewController.swift
//  KirillApp
//
//  Created by кирилл ларионов on 02.09.2021.
//

import UIKit

class ViewController: UIViewController {
    private var myTableView: UITableView!
    private let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty:Bool{
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var  isFilter:Bool{
        return searchController.isActive && !searchBarIsEmpty
    }
    private let addButton = UIBarButtonItem.init(systemItem: .add)
    private let emptyCity = Weather()
    var filterCityArray = [Weather]()
    let refreshScreen = UIRefreshControl()
    private var nameCitiesArray = ["Москва","Санкт-Петербург","Казань","Екатеринбург",
                                   "Нижний Новгород","Сочи","Тюмень","Новосибирск","Уфа","Ростов-на-Дону"]
    private var cityArray = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Погода"
        if cityArray.isEmpty {
            cityArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        createdTableView()
        addCity()
        myTableView.dataSource = self
        myTableView.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "поиск"
        searchController.searchBar.sizeToFit()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonAdd))
        refreshScreen.attributedTitle = NSAttributedString(string: "Refresh..")
        refreshScreen.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        myTableView.addSubview(refreshScreen)
        myTableView.reloadData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        
        self.myTableView.reloadData()
        //self.myTableView.isEditing = true
        print("it's working!")
        refreshScreen.endRefreshing()
    }
    
    func addCity() { 
        getCityWeather(cityArray: nameCitiesArray) { (index,weather) in
            self.cityArray[index] = weather
            self.cityArray[index].name = self.nameCitiesArray[index]
        }
        print(cityArray)
    }
    
    @objc func buttonAdd(){
        alertC(name: "Город", placeholder: "Введите название города") { city in
            self.nameCitiesArray.append(city)
            self.cityArray.append(self.emptyCity)
            self.addCity()
        }
    }
    
    func alertC(name: String,placeholder:String,completionHadler: @escaping (String)->Void){
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let textField = alert.textFields?.first
            guard let text = textField?.text else {return}
            completionHadler(text)
        }
        
        alert.addTextField { tf in
            tf.placeholder = placeholder
        }
        let alertCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(alertOk)
        alert.addAction(alertCancel)
        present(alert, animated: true, completion: nil)
    }
}

//MARK - func createTableView
extension ViewController {
    fileprivate func createdTableView() {
        let width: CGFloat = self.view.frame.width
        let height: CGFloat = self.view.frame.height
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myTableView)
        //constraint TableView
        NSLayoutConstraint.activate([
            myTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            myTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0)
        ])
        
    }
    
    
}
//MARK - UITableViewDelegate
//MARK -   переход secondC
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = SecondViewController()
        
        if isFilter {
            let filter = filterCityArray[indexPath.row]
            secondViewController.weatherModel = filter
        }else{
            let cityWeather = cityArray[indexPath.row]
            secondViewController.weatherModel = cityWeather
        }
        self.navigationController?.pushViewController(secondViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView,trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {(_,_,completionHandler ) in
            let editingRow = self.nameCitiesArray[indexPath.row]
            if let index = self.nameCitiesArray.firstIndex(of: editingRow){
                self.cityArray.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44 
    }
}

//MARK - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFilter {
            return filterCityArray.count
        }
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomTableViewCell
        var weather = Weather()
        
        if isFilter {
            weather = filterCityArray[indexPath.row]
        }else{
            weather = cityArray[indexPath.row]
        }
        cell.configure(weather: weather)
        return cell
    }
}


extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentText(searchController.searchBar.text!)
    }
    
    private func filterContentText(_ searchText:String){
        filterCityArray = cityArray.filter{ $0.name.contains(searchText) }
        
        myTableView.reloadData()
    }
}
