//
//  LocationSearchView.swift
//  CSCI6212_Project
//
//  Created by zuxuan chen on 9/11/23.
//  Updated by Shiddarth Srivastava on 09/13/2023.

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @Binding var showLocationSearchView:Bool
    var body: some View {
        VStack{
            //header view
            
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    Circle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack{
                    TextField("Current location", text:
                                $startLocationText)
                    .frame(height: 32)
                    .background(Color(
                        .systemGroupedBackground))
                    .padding(.trailing)
                    
                    TextField("Where to?", text:
                                $viewModel.queryFragment)
                    .frame(height: 32)
                    .background(Color(
                        .systemGray4))
                    .padding(.trailing)
                    
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // list view
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.results, id: \.self){
                        result in
                        
                        LocationSearchResultCell(title:result.title, subtitle:   result.subtitle)
                            .onTapGesture {
                                viewModel.selectLocation(_location: result.title)
                                showLocationSearchView.toggle()
                                
                            }
                        
                    }
                }
            }
        }
        .background(.white)
    }
}

//Updated by shiddarth video timing : 1:19:48 
struct LocationSearchView_Previews : PreviewProvider {
    static var previews: some View{
        LocationSearchView(showLocationSearchView:.constant(false))
    }    }

