//
//  SearchBar.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 6/9/23.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack {

            Image("Vector (Stroke)")
                .frame(width: 13.90141, height: 13.90627)
                .padding(.leading, 17)
                .padding(.bottom, 4)
            
            
            
            Text("I want to explore ...")
              .font(Font.custom("Poppins-Regular", size: 14))
              .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
              .padding(.leading, 14)
            
            Spacer()
            
            Image("filter")
            .frame(width: 21, height: 20)
            .padding(.trailing, 17)
        }.frame(width: 335, height: 48)
            .background(Color(red: 0.96, green: 0.95, blue: 0.99))
            .cornerRadius(16)

    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
