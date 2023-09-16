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

}

// MARK: - MKLocalSearchCompletionDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }


}
