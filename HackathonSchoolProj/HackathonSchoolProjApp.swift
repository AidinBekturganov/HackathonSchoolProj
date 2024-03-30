//
//  HackathonSchoolProjApp.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 31/8/23.
//

import SwiftUI

struct View2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("POP")
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ContentView1: View {
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink(destination: SearchView()) {
                    Text("PUSH")
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                
                SearchBar()
                SearchBar()
                SearchBar()
                SearchBar()

            }
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@main
struct HackathonSchoolProjApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
