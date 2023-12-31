//
//  MapViewActionButton.swift
//  CSCI6212_Project
//
//  Created by zuxuan chen on 9/11/23.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState:MapViewState
    var body: some View {
        Button{
            withAnimation(.spring()){
                actionForState(mapState)
            }
        } label:{
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    func actionForState(_ state: MapViewState){
        switch state {
        case .noInput:
            print("DEBUG:No Input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected:
            mapState = .noInput
        }
    }
    func imageNameForState(_ state: MapViewState) -> String{
        switch state {
        case .noInput:
           return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
            return "arrow.left"
            
        }
        
    }
    
}

struct test_Previews_5: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
