//
//  SearchDetailViewController.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit
import RxSwift

final class SearchDetailViewController:UIViewController{
    
    let contentView = WeatherSearchDetailView()
    var coordinatorDelegate: DetailCoordinatorProtocol?
    var viewModel: SearchDetailViewModel!
    var weatherTableData:[WeatherData] = []{
        didSet{
            contentView.tableView.reloadData()
        }
    }
    private let bag = DisposeBag()
    private var temptype:Temp = .celcius
    
    override func viewDidLoad() {
       super.viewDidLoad()
        initSetUp()
        setupData()
    }
    
    override func loadView() {
        view = contentView
    }
    
    private func initSetUp(){
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.sectionHeaderTopPadding = 0
        navigationController?.navigationBar.prefersLargeTitles = true
        contentView.segmentControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .allEvents)
    }
    
    private func updateData(_ data:[WeatherData]){
        weatherTableData = data
    }
    
    func setupData(){
        guard let weather = viewModel.weather else {
            simpleAlert(title: StringConstants.errorTitle, message: StringConstants.errorString) { [weak self] in
                self?.coordinatorDelegate?.pop()
            }
            return
        }
        let temp = temptype == .celcius ? viewModel.fahrenheitToC(f: weather.temp) : viewModel.toFahrenheit(f: weather.temp)
        contentView.tempLabel.text = temp
        contentView.weatherCondLabel.text = weather.cond
        weatherTableData = viewModel.createWeatherDataList(weather, temptype)
        contentView.weatherImg.loadImageUsingKingFisher(urlString: weather.icon, placeholder: "sun", cornerRadius: 0)
        setUpNavigationTitle(weather.city)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            temptype = Temp.celcius
            setupData()
        } else if sender.selectedSegmentIndex == 1{
            temptype = Temp.fahrenheit
           setupData()
        }
    }
}
