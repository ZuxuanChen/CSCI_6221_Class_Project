//
//  LocationSearchResultCell.swift
//  CSCI6212_Project
//
//  Created by zuxuan chen on 9/11/23.
//  Updated by Shiddarth Srivastava on 09/13/2023.
import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .accentColor(.white)
                .frame(width:40, height: 40)
            
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.body)
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct test_Previews_4: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell(title:"Starbucks", subtitle:"123 Main Street")
    }
}


