//
//  EpDetial.swift
//  ios_Hw2
//
//  Created by Yu Zhi on 2022/10/22.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct Song: View {
    var song: moreSong
    var body: some View {
        NavigationView{
           List{
                Section(header:Header1(name:"動畫配樂：")){
                    ScrollView(.horizontal){
                        VStack{
                            ForEach(0..<5){(index) in
                                DisclosureGroup(
                                    content:{
                                        VStack{
                                            Text(word[index])
                                        }.frame(width: 300, height: 270)
                                         .padding()
                                    },label: {
                                        Music2(song: playsong[index])
                                    }
                                ).frame(width: 300)
                                    
                            }
                        }.padding()
                          
                    }
                }
               Section(header:Header1(name:"更多遊戲音樂：")){
                   Link("🔗點我更多", destination:URL( string:"https://www.youtube.com/watch?v=ZZY8xA6gGuw")!)
               }
           }.frame(height:900)
        }.navigationBarTitle("更多資訊")
            
    }
}

struct Song_Previews: PreviewProvider {
    static var previews: some View {
        Song( song: playsong[0])
    }
}

struct Music2 : View {
    @State var play = true
  
    var song: moreSong
    let player = AVPlayer()
    let commandCenter = MPRemoteCommandCenter.shared()
    
    var body: some View{
        HStack(){
            Button(action: {
                let fileUrl = Bundle.main.url(forResource:song.song, withExtension: "mp3")
                let playerItem = AVPlayerItem(url: fileUrl!)
                self.player.replaceCurrentItem(with: playerItem)
                self.play.toggle()
                if self.play{
                    self.player.pause()
                }
                else{
                    self.player.play()
                }
                commandCenter.playCommand.addTarget { event in
                    if self.player.rate == 0.0 {
                            self.player.play()
                            return .success
                }
                    return .commandFailed
                }
                self.commandCenter.pauseCommand.addTarget { event in
                    if self.player.rate == 1.0 {
                            self.player.pause()
                            return .success
                    }
                    return .commandFailed
                }
            }){
                Image(systemName: play ? "play.circle.fill" : "pause.circle.fill")
                    .resizable()
                    .foregroundColor(Color(hue: 0.141, saturation: 0.19, brightness: 0.409))
                    .frame(width:30,height:30)
                    
            }.buttonStyle(PlainButtonStyle())
            VStack(alignment:.leading){
                Text(song.song)
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                Text(song.intro)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(15)
    }
}


