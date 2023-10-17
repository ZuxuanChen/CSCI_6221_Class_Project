//
//  LocationSearchViewModel.swift
//  CSCI6212_Project
//
//  Created by Shiddarth Srivastava 09/13/2023.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject{

    //MARk:- Properties

    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = ""{
        didSet{
            searchCompleter.queryFragment = queryFragment
        }
    }

    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        }
    //Mark helpers
    func selectLocation(_ localSearch:MKLocalSearchCompletion){
        locationSearch(forLocalSearchCompletion: localSearch){ response, error in
            if let error = error{
                print("Debug:location sdearch failed with error \(error.localizedDescription)")
                return
            }
            guard  let item=response?.mapItems.first else{ return }
            let coordinate=item.placemark.coordinate
            self.selectedLocationCoordinate = coordinate
            print("DEBUG:Location coordinates \(coordinate)")
            
        }
    }
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery=localSearch.title.appending(localSearch.subtitle)
        let search=MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
        
    }

}

// MARK: - MKLocalSearchCompletionDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }


}
