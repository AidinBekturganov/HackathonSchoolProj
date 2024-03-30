//
//  SearchView.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 13/9/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var showBottomSheet = false
    @State private var selectedFilter = "Visual identity"
    @State private var isImageVisible = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    let suggestionKeywords = ["Keyword 1", "Keyword 2", "Keyword 3", "Keyword 4"]
    let filterOptions = ["Visual identity", "Painting", "Coding", "Writing"]
    
    let mentors = [Mentor(Name: "Robertson Connie", Image: "Image", Rating: "5.0", IsBestOfTheMonth: true, Position: "Lead Product Designer"),
                   Mentor(Name: "Robertson Connie", Image: "Image 1", Rating: "5.0", IsBestOfTheMonth: true, Position: "Senior Product Designer"),
                  Mentor(Name: "Robertson Connie", Image: "Image 2", Rating: "4.5", IsBestOfTheMonth: false, Position: "Middle+ Product Designer"),
                   Mentor(Name: "Robertson Connie", Image: "Image 3", Rating: "3.5", IsBestOfTheMonth: false, Position: "Middle+ Product Designer"),
                   Mentor(Name: "Robertson Connie", Image: "Image 4", Rating: "2.5", IsBestOfTheMonth: false, Position: "Middle+ Product Designer")]
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("Icon")
                            .frame(width: 30, height: 30)
                    }.padding(.leading, 20)
                        .padding(.bottom, 31)
                    
                    Spacer()
                }.navigationBarTitle("")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                
                //            VStack {
                //                        Button(action: {
                //                            self.presentationMode.wrappedValue.dismiss()
                //                        }) {
                //                            Text("POP")
                //                        }
                //                    }
                //                    .navigationBarTitle("")
                //                    .navigationBarBackButtonHidden(true)
                //                    .navigationBarHidden(true)
                
                
                
                
                
                HStack {
                    
                    Image("Vector (Stroke)")
                        .frame(width: 13.90141, height: 13.90627)
                        .padding(.leading, 17)
                        .padding(.bottom, 4)
                    
                    
                    
                    //                Text("I want to explore ...")
                    //                  .font(Font.custom("Poppins", size: 14))
                    //                  .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
                    //                  .padding(.leading, 14)
                    
                    TextField("I want to explore ...", text: $searchText)
                        .font(.system(size: 14))
                        .background(Color.clear)
                        .tint(Color.black)
                        .onChange(of: searchText) { newValue in
                            isImageVisible = !newValue.isEmpty
                            // Perform search or filter logic here based on newValue
                            // You can update your search results based on user input
                        }
                        .padding(.leading, 13)
                    
                    if isImageVisible {
                        Button {
                            searchText = ""
                            isImageVisible = false
                        } label: {
                            Image("Subtract")
                                .frame(width: 16, height: 16)
                                .padding(.trailing, 21)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showBottomSheet.toggle()
                    }) {
                        Image("filter")
                            .font(.title)
                    }.frame(width: 21, height: 20)
                        .padding(.trailing, 17)
                        .sheet(isPresented: $showBottomSheet) {
                            BottomSheetView(isSheetPresented: $showBottomSheet)
                                .presentationDetents([.fraction(0.65)])
                                .presentationDragIndicator(.visible)
                            
                        }
                    
                }.frame(width: 335, height: 48)
                    .background(Color(red: 0.96, green: 0.95, blue: 0.99))
                    .cornerRadius(16)
                    .padding(.bottom, 16)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 13) {
                        ForEach(filterOptions, id: \.self) { filter in
                            Button(action: {
                                searchText = filter
                                // Apply the selected filter to your search results
                            }) {
                                Text(filter)
                                    .padding(8)
                                    .background(Color(red: 0.96, green: 0.95, blue: 0.99))
                                    .foregroundColor(Color("GrayForFont"))
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                HStack () {
                    Text("Results")
                        .font(Font.custom("Poppins", size: 18)
                            .weight(.medium))
                        .padding(.top, 16)
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                
                
                ScrollView {
                    LazyVStack {
                        ForEach(mentors) { mentor in
                            
                            NavigationLink(destination: VideoPlayerView()) {
                                MentorRowView(mentor: mentor)
                                    .padding(12)
                                    .background(
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 300, height: 96)
                                            .cornerRadius(12)
                                            .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 0)
                                    ).navigationBarTitle("")
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true)

                            }
                           
                            
                            
                        }
                    }
                }.navigationBarBackButtonHidden(true)
                
                
                
                
                
                //            List(suggestionKeywords, id: \.self) { keyword in
                //                Text(keyword)
                //                    .onTapGesture {
                //                        searchText = keyword
                //                        // Perform search or filter logic with the selected suggestion
                //                    }
                //            }
            }.navigationBarBackButtonHidden(true)
                
        }.navigationBarBackButtonHidden(true)
       
    }
}

struct BottomSheetView : View {
    
    @State private var selectedOption = "Option 1"
    @State private var isDropdownOpen = false
    @State private var isPickerVisible = false
    @State private var birthMonth: DropdownMenuOption? = nil
    
    @Binding var isSheetPresented: Bool

    @State private var selection: String = "Easy"
    
    let options = ["Option 1", "Option 2", "Option 3"]
    
    
    
    var body: some View {
        
        VStack {
            HStack {
                Image("close")
                    .padding(.leading, 25)
                    .padding(.top, 29.3)
                
                Spacer()
                
                Text("Filter")
                    .font(
                    Font.custom("Poppins", size: 18)
                    .weight(.medium)
                    )
                    .padding(.top, 29)
                    .padding(.trailing, 35)

                Spacer()
                   
                
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Language")
                .font(
                Font.custom("Poppins", size: 18)
                .weight(.medium)
                )
//                .padding(.leading, 10)
                
                HStack {
                    Text("English")
                        .padding(.leading, 22)
                        .padding(.top, 14)
                        .padding(.bottom, 13)
                    
                    Spacer()
                    
                    Image("Arrow - Right 2")
                        .padding(.trailing, 18)
                        .padding(.top, 12)
                        .padding(.bottom, 11)

                }.frame(width: 335, height: 48)
                    .background(Color(red: 0.96, green: 0.95, blue: 0.99))
                    .cornerRadius(10)
            }.padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Region")
                .font(
                Font.custom("Poppins", size: 18)
                .weight(.medium)
                )
//                .padding(.leading, 10)
                
                HStack {
                    Text("Chui")
                        .padding(.leading, 22)
                        .padding(.top, 14)
                        .padding(.bottom, 13)
                    
                    Spacer()
                    
                    Image("Arrow - Right 2")
                        .padding(.trailing, 18)
                        .padding(.top, 12)
                        .padding(.bottom, 11)

                }.frame(width: 335, height: 48)
                    .background(Color(red: 0.96, green: 0.95, blue: 0.99))
                    .cornerRadius(10)
            }.padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Town")
                .font(
                Font.custom("Poppins", size: 18)
                .weight(.medium)
                )
//                .padding(.leading, 10)
                
                HStack {
                    Text("Tokmok")
                        .padding(.leading, 22)
                        .padding(.top, 14)
                        .padding(.bottom, 13)
                    
                    Spacer()
                    
                    Image("Arrow - Right 2")
                        .padding(.trailing, 18)
                        .padding(.top, 12)
                        .padding(.bottom, 11)

                }.frame(width: 335, height: 48)
                    .background(Color(red: 0.96, green: 0.95, blue: 0.99))
                    .cornerRadius(10)
            }.padding(.top, 20)
            
            Spacer()
            
            HStack {
                Button {
                    
                } label: {
                    Text("Clear")
                      .font(
                        Font.custom("Poppins", size: 16)
                          .weight(.medium)
                      )
                      .frame(width: 89.5, height: 50.5)
                      .foregroundColor(Color("BlueForFont"))
                      .overlay(
                            RoundedRectangle(cornerRadius: 20)
//                                .foregroundColor(.clear)
                                .stroke(Color("BlueForFont"), lineWidth: 1)
                              
                                
                               
                    )
                }
                
                Button {
                    isSheetPresented.toggle()
                } label: {
                    Text("Apply Filter")
                    .font(
                        Font.custom("Poppins", size: 16)
                        .weight(.medium)
                    )
                    .frame(width: 236, height: 50.5)
                    .foregroundColor(.white)
                      .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("BlueForFont"))
                                
                               
                    )
                }
               

            }
        }
        
        
        
        
        
        
//        VStack {
//
//            DropDown(
//                content: options,
//                selection: $selectedOption,
//                activeTint: .black.opacity(0.1),
//                inActiveTint: .black.opacity(0.1)
//            )
//                    .frame(width: 130)
//
//            DropDown(
//                content: options,
//                selection: $selectedOption,
//                activeTint: .black.opacity(0.1),
//                inActiveTint: .black.opacity(0.1)
//            )
//                    .frame(width: 130)
//
//
//        }.frame(maxWidth: .infinity, maxHeight: .infinity)
//            .environment(\.colorScheme, .dark)
//            .background {
//                Color("BG")
//                    .ignoresSafeArea()
//            }
        
    }
}

struct DropDown: View {
    var content : [String]
    @Binding var selection: String
    var activeTint: Color
    var inActiveTint: Color
    
    @State private var expandView: Bool = false
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(content, id: \.self) { title in
                    RowView(title, size)
                }
            }
            .background {
                Rectangle()
                    .fill(inActiveTint)
            }
            
        }
        .frame(height: 55)
        .overlay(alignment: .trailing) {
            Image("chevron.up.chevron.down")
                .padding(.trailing, 10)
        }
        .mask(alignment: .top) {
            Rectangle()
                .frame(height: expandView ? CGFloat(content.count) * 55 : 55)
        }
    }
    
    @ViewBuilder
    func RowView(_ title: String, _ size: CGSize) -> some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal)
            .frame(width: size.width, height: size.height, alignment: .leading)
            .background {
                if selection == title {
                    Rectangle()
                        .fill(activeTint)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    expandView.toggle()
                }
            }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
