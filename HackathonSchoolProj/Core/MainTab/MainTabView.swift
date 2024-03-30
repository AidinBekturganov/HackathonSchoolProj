//
//  MainTabView.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 4/9/23.
//

import SwiftUI

enum Tabs: Int {
    case home = 0
    case calendar = 1
    case videos = 2
    case profile = 3
}

struct MainTabView: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        
        HStack (alignment: .center) {
            
            Spacer()
            Button {
                selectedTab = .home
            } label: {
                HStack {
                    Image("Home")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text("Home")
                        .foregroundColor(Color("BlueForFont"))
                }
            }
            .background(
                Rectangle()
                    .fill(Color("LightBlueForRectButtonTab"))
                    .frame(width: 105, height: 44)
                    .cornerRadius(12)
            )
            
            Spacer()
            
            Button {
                selectedTab = .calendar
            } label: {
                Image("Frame 20")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23.11, height: 22)
            }
            
            Spacer()
            
            Button {
                selectedTab = .videos
            } label: {
                Image("Frame 18")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23, height: 22.02)
            }
            
            Spacer()
            
            Button {
                selectedTab = .profile
            } label: {
                Image("Frame 19")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
            }
            
            Spacer()

        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(selectedTab: .constant(.home))
    }
}
