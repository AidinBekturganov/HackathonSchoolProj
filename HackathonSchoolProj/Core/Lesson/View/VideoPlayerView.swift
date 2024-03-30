//
//  VideoPlayerView.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 17/9/23.
//

import SwiftUI
import AVFoundation
import AVKit


struct VideoPlayerView: View {
    
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "mixkit-professor-explaining-human-anatomy-24146-medium", withExtension: "mp4")!) // 2
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                PlayerView().ignoresSafeArea().navigationBarBackButtonHidden(true) .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                GeometryReader { geometry in
                    // Your content here
                    RoundedRectangle(cornerRadius: 15).foregroundColor(.white)
                        .frame(width: geometry.size.width, height: geometry.size.height + 100).offset(x:0, y: 180)
                }
                
                VStack(alignment: .leading) {
                    Text("Daina Bekturganova")
                        .font(
                            Font.custom("Poppins", size: 20)
                                .weight(.bold)
                        )
                    
                    HStack {
                        Text("Product Designer @Microsoft")
                            .font(Font.custom("Poppins", size: 12))
                            .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.59))
                        
                        Spacer()
                        
                        Image("Vector")
                        
                        Text("5.0 Rating")
                            .font(Font.custom("Poppins", size: 12))
                            .kerning(0.5)
                            .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.59))
                    }.padding(.top, 10)
                    
                    
                    Text("About  Melek")
                        .font(
                            Font.custom("Poppins", size: 16)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.22))
                        .padding(.top, 20)
                    
                    Text("""
                     Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium
                     """)
                    .font(Font.custom("Poppins", size: 12))
                    .foregroundColor(Color(red: 0.58, green: 0.58, blue: 0.64))
                    .padding(.top, 2)
                    
                    Text("View more")
                        .font(Font.custom("Poppins", size: 12))
                        .foregroundColor(Color(red: 0.58, green: 0.58, blue: 0.64)).padding(.top, 2)
                    
                    HStack {
                        Text("01 ")
                            .font(
                                Font.custom("Poppins", size: 24)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
                        
                        VStack(alignment: .leading) {
                            Text("Welcome Speach")
                                .font(Font.custom("Poppins", size: 14))
                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.22))
                            
                            HStack {
                                Text("2:10 mins")
                                    .font(
                                        Font.custom("Poppins", size: 12)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 1, green: 0.41, blue: 0.02))
                                
                                Image("icon-done")
                            }
                        }
                        
                        Spacer()
                        
                        Image("play")

                    }.padding(.top, 20)
                    
                    HStack {
                        Text("02 ")
                            .font(
                                Font.custom("Poppins", size: 24)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
                        
                        VStack(alignment: .leading) {
                            Text("Profession overview")
                                .font(Font.custom("Poppins", size: 14))
                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.22))
                            
                            HStack {
                                Text("6:09 mins")
                                    .font(
                                        Font.custom("Poppins", size: 12)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
                            }
                        }
                        
                        Spacer()
                        
                        Image("play 2")
                    }.padding(.top, 20)
                    
                    HStack {
                        Text("03 ")
                            .font(
                                Font.custom("Poppins", size: 24)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
                        
                        VStack(alignment: .leading) {
                            Text("Strong and week sides")
                                .font(Font.custom("Poppins", size: 14))
                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.22))
                            
                            HStack {
                                Text("4:33 mins")
                                    .font(
                                        Font.custom("Poppins", size: 12)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
                            }
                            
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: SubscriptionView()) {
                            Image("play 3")
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true)

                        }
                    }.padding(.top, 20)
                    
                    HStack {
                        Text("04 ")
                            .font(
                                Font.custom("Poppins", size: 24)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
                        
                        VStack(alignment: .leading) {
                            Text("My education path")
                                .font(Font.custom("Poppins", size: 14))
                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.22))
                            
                            HStack {
                                Text("5:43 mins")
                                    .font(
                                        Font.custom("Poppins", size: 12)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.82))
                            }
                            
                        }
                        
                        Spacer()
                        
                        Image("play 3")

                    }.padding(.top, 20)
   
                }.padding().offset(x:0, y: 60)
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        Image("Vector (Stroke) 1")
                            .frame(width: 89, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("Color 1"))
                            )
                    }
                    
                    NavigationLink(destination: ScheduleView()) {
                        Text("Book Online Meeting")
                            .font(
                                Font.custom("Poppins", size: 16)
                                    .weight(.medium)
                            )
                            .frame(width: 236, height: 50)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("BlueForFont"))
                                
                                
                            )
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)

                    }

                }.offset(x:0, y: 360).navigationBarBackButtonHidden(true)
                
                ZStack (alignment: .top) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        print("DEBUG : CLICK CLICK")
                    }) {
                        Image("left")
                    }.allowsHitTesting(true).padding(.bottom, 725).padding(.leading, -180)
                       
                }
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .allowsHitTesting(true).onTapGesture {
                    print("FSDFDSF")
                }
               
            }.navigationBarBackButtonHidden(true)

        }                                .navigationBarBackButtonHidden(true)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
