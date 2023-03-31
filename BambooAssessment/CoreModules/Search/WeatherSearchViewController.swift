//
//  WeatherSearchViewController.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit
import RxSwift

final class WeatherSearchViewController:UIViewController{
    
    var cells:[CellController] = []
    let contentView = WeatherSearchView()
    var viewModel:SearchViewModel!
    var coordinatorDelegate: DetailCoordinatorProtocol?
    var tap:Observable<Void> = Observable.empty()
    var lat:String = ""
    var lon:String = ""
    var city:String = ""
    private let bag = DisposeBag()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialsetUp()
        setUpControllers()
    }
    
    func initialsetUp(){
        navigationItem.title = "Welcome"
        navigationController?.navigationBar.prefersLargeTitles = true
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.sectionHeaderTopPadding = 0
    }
    
    func setUpControllers(){
        let cell1 = ChooseCityCellController()
        let cell2 = LocationCellController()
        let cell3 = SearchCityCellController()
        cell3.action = { [weak self]  in
            self?.fetchOnSelectOrClick(location: cell2.model, selectedCity: cell3.model[0].output)
        }
        
        cell1.action = { [weak self] selected in
            self?.fetchOnSelectOrClick(location: cell2.model, selectedCity: selected)
        }
        cells.append(cell1)
        cells.append(cell2)
        cells.append(cell3)
    }
    
    func bind(){
        let input = SearchViewModel.Input(tap: tap,lat: lat, lon: lon, city: city)
        
        let output = viewModel.fetch(input: input)
        
        output.tableData
            .asDriver(onErrorJustReturn: nil)
            .drive(onNext: { [weak self] weather in
                self?.moveToNextPage(weather: weather)
            })
            .disposed(by: bag)
    }
    
    func moveToNextPage(weather: WeatherDomain?){
        coordinatorDelegate?.showDetail(weather)
    }
    
    func fetchOnSelectOrClick(location:[CellModel], selectedCity:String){
        location.forEach { [weak self] model in self?.getCoord(model: model) }
        city = selectedCity
        tap = Observable.just(())
        bind()
    }
    
    func getCoord(model:CellModel){
        if model.title == "Latitude"{
            lat = model.output
        }else{
            lon = model.output
        }
    }
}
