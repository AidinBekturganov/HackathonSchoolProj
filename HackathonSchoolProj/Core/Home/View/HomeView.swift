//
//  HomeView.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 3/9/23.
//

import SwiftUI

struct ViewSizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct ViewGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewSizeKey.self, value: geometry.size)
        }
    }
}


struct HomeView: View {
    
    @State var selectedTab: Tabs = .home
    
    @State private var selectedTabOfFilter = 0
    
    @State private var textWidth: CGFloat = 0
        @State private var textHeight: CGFloat = 0
    
    let mentors = [Mentor(Name: "Robertson Connie", Image: "Image", Rating: "5.0", IsBestOfTheMonth: true, Position: "Lead Product Designer"),
                   Mentor(Name: "Robertson Connie", Image: "Image 1", Rating: "5.0", IsBestOfTheMonth: true, Position: "Senior Product Designer"),
                  Mentor(Name: "Robertson Connie", Image: "Image 2", Rating: "4.5", IsBestOfTheMonth: false, Position: "Middle+ Product Designer"),
                   Mentor(Name: "Robertson Connie", Image: "Image 3", Rating: "3.5", IsBestOfTheMonth: false, Position: "Middle+ Product Designer"),
                   Mentor(Name: "Robertson Connie", Image: "Image 4", Rating: "2.5", IsBestOfTheMonth: false, Position: "Middle+ Product Designer")]

    
    var listOfMenuItems: [String] = ["Product Designer", "Data Analyst", "C# Developer", "Vue.js Developer"]
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Image("ShiftED")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 107, height: 26)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color("LightPurpl"))
                        .frame(width: 36, height: 36)
                        .padding(.trailing, 20)
                }
                
                NavigationLink(destination: SearchView()) {
                    SearchBar().padding(.top, 16)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }

                HStack {
                    Button {
                        
                    } label: {
                        Image("Frame 23")
                    }
                    
                    Button {
                        
                    } label: {
                        Image("Frame 22")
                    }
                    
                }
                
                VStack {
                    HStack {
                        Text("Most searched this month")
                            .padding(.top, 36)
                            .padding(.leading, 20)
                            .font(Font.custom("Poppins", size: 15)
                                .weight(.medium))
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        
                        HStack(spacing: 20) {
                            ForEach(0..<listOfMenuItems.count, id: \.self) { index in
                                
                                Button {
                                    selectedTabOfFilter = index
                                } label: {
                                    if (selectedTabOfFilter == index) {
                                        
                                        Text(listOfMenuItems[index]).font(Font.custom("Poppins", size: 14))
                                            .foregroundColor(.white)
                                            .background(GeometryReader { proxy in
                                                Color.clear.onAppear {
                                                    textWidth = proxy.size.width
                                                    textHeight = proxy.size.height
                                                }
                                            })
                                            .background(
                                                Rectangle()
                                                    .foregroundColor(.clear)
                                                    .background(Color(red: 0.24, green: 0.36, blue: 1))
                                                    .cornerRadius(18)
                                                    .frame(width: textWidth + 10, height: textHeight + 10)
                                            )
                                        
                                    } else {
                                        Text(listOfMenuItems[index]).font(Font.custom("Poppins", size: 14))
                                            .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.59))
                                    }
                                    
                                }
                                
                            }
                        }.padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        
                    }.scrollIndicators(.hidden)

                }

                ScrollView {
                    LazyVStack {
                        ForEach(mentors) { mentor in
                            MentorRowView(mentor: mentor)
                                .padding(12)
                                .background(
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 300, height: 96)
                                        .cornerRadius(12)
                                        .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 0)
                                )
                        }
                    }
                }.padding(.bottom, 10)
                
                Spacer()
                
                MainTabView(selectedTab: $selectedTab)
                    .background(
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 74)
                            .cornerRadius(22)
                            .shadow(color: Color.black.opacity(0.1), radius: 22, x: 0, y: 0)
                    )
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
