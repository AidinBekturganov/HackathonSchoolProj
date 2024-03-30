//
//  PlayerView.swift
//  HackathonSchoolProj
//
//  Created by Aidin Bekturganov on 17/9/23.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "mixkit-professor-explaining-human-anatomy-24146-medium", withExtension: "mp4")!)
    @State var isplaying = false
    @State var showcontrols = false
    @State var value : Float = 0

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        VStack{

            ZStack{
                VideoPlayer(player: $player)
                
                if self.showcontrols{
                    
                    Controls(player: self.$player, isplaying: self.$isplaying, pannel: self.$showcontrols,value: self.$value)
                }
 
            }
            .frame(height: UIScreen.main.bounds.height / 3.5)
            .onTapGesture {
                
                self.showcontrols = true
            }

            GeometryReader{_ in
                
                VStack{
                    
                    Text("Custom Video Player").foregroundColor(.white)
                }
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .onAppear {
            
            self.player.play()
            self.isplaying = true
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}

struct Controls : View {
    
    @Binding var player : AVPlayer
    @Binding var isplaying : Bool
    @Binding var pannel : Bool
    @Binding var value : Float
    @Environment(\.presentationMode) var presentationMode
    var body : some View{
        
        VStack{
            Spacer()

            HStack{
                Spacer()
                
                Button(action: {
                    
                    if self.isplaying{
                        
                        self.player.pause()
                        self.isplaying = false
                    }
                    else{
                        
                        self.player.play()
                        self.isplaying = true
                    }
                    
                }) {
                    
                    Image(systemName: self.isplaying ? "pause.fill" : "play.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(
                            Circle().frame(width: 56, height: 56).foregroundColor(.white).opacity(0.6)
                        )
                        .padding(20)
                }
                
                Spacer()
            }
            
            Spacer()
            
            HStack() {
                Spacer()
                Image("Icon 1")
            }
            
            CustomProgressBar(value: self.$value, player: self.$player, isplaying: self.$isplaying).padding(.bottom, 10)

        }.padding()
        .background(Color.black.opacity(0.4))
        .onTapGesture {
                
            self.pannel = false
        }
        .onAppear {
            
            self.player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main) { (_) in
                
                self.value = self.getSliderValue()
                
                if self.value == 1.0{
                    
                    self.isplaying = false
                }
            }
        }
        
        
    }
    
    func getSliderValue()->Float{
        
        return Float(self.player.currentTime().seconds / (self.player.currentItem?.duration.seconds)!)
    }
    
    func getSeconds()->Double{
        
        return Double(Double(self.value) * (self.player.currentItem?.duration.seconds)!)
    }
}

struct CustomProgressBar : UIViewRepresentable {
    
    
    func makeCoordinator() -> CustomProgressBar.Coordinator {
        
        return CustomProgressBar.Coordinator(parent1: self)
    }
    
    
    @Binding var value : Float
    @Binding var player : AVPlayer
    @Binding var isplaying : Bool
    
    func makeUIView(context: UIViewRepresentableContext<CustomProgressBar>) -> UISlider {
     
        let slider = UISlider()
        slider.minimumTrackTintColor = UIColor(Color("Color"))
        slider.maximumTrackTintColor = .white
        slider.thumbTintColor = .red
        slider.setThumbImage(UIImage(named: "Group 140"), for: .normal)
        slider.value = value
        slider.addTarget(context.coordinator, action: #selector(context.coordinator.changed(slider:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<CustomProgressBar>) {
        
        uiView.value = value
    }
    
    class Coordinator : NSObject{
        
        var parent : CustomProgressBar
        
        init(parent1 : CustomProgressBar) {
            
            parent = parent1
        }
        
        @objc func changed(slider : UISlider){
            
            if slider.isTracking{
                
                parent.player.pause()
                
                let sec = Double(slider.value * Float((parent.player.currentItem?.duration.seconds)!))
                
                parent.player.seek(to: CMTime(seconds: sec, preferredTimescale: 1))
            }
            else{
                
                let sec = Double(slider.value * Float((parent.player.currentItem?.duration.seconds)!))
                  
                parent.player.seek(to: CMTime(seconds: sec, preferredTimescale: 1))
                
                if parent.isplaying{
                    
                    parent.player.play()
                }
            }
        }
    }
}

class Host : UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}

struct VideoPlayer : UIViewControllerRepresentable {
    
    @Binding var player : AVPlayer
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resize
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayer>) {
        
        
    }
}
