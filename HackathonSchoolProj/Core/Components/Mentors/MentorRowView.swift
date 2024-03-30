//
//  MentorRowView.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 3/9/23.
//

import SwiftUI

struct Mentor : Identifiable {
    var id = UUID()
    var Name : String
    var Image : String
    var Rating : String
    var IsBestOfTheMonth : Bool
    var Position : String
}

struct MentorRowView: View {
    
    var mentor : Mentor
    
    var body: some View {
        
        
        VStack {
            HStack(alignment: .center, spacing: 12) {
                Image(mentor.Image).resizable().frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue)).cornerRadius(7)
        
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(mentor.Position).font(
                        Font.custom("Poppins", size: 14)
                        .weight(.medium)
                        )
                    
                    HStack {
                        Image("Frame 24")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 8.5, height: 10)
                        
                        Text(mentor.Name).foregroundColor(.gray).font(Font.custom("Poppins", size: 12))
                    }
                    
                    HStack {
                        Image("Vector")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                        
                        Text("\(mentor.Rating)  Rating").foregroundColor(.gray).font(Font.custom("Poppins", size: 12))
                            .kerning(0.5)
                        
                        if (mentor.IsBestOfTheMonth) {
                            Text("Best of the month")
                                .foregroundColor(Color("OrangeFontRow"))
                                .font(Font.custom("Poppins", size: 10))
                                .background(
                                    Rectangle()
                                        .frame(width: 108, height: 18)
                                        
                                        .foregroundColor(Color("PinkLightRow"))
                                        .cornerRadius(9)
                                        
                                ).padding(.leading, 19)
                        }

                    }
                }
            }
        }
        .padding()
    }
}

struct MentorRowView_Previews: PreviewProvider {
    static var previews: some View {
        MentorRowView(mentor: Mentor(Name: "", Image: "", Rating: "", IsBestOfTheMonth: false, Position: ""))
    }
}
