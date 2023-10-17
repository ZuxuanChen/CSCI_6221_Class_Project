//
//  LocationSearchActivationView.swift
//  CSCI6212_Project
//
//  Created by zuxuan chen on 9/11/23.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        
        .frame(width:  UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black, radius: 6)
        
        )
    }
}

struct test_Previews_1: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
