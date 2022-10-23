//
//  MusicView.swift
//  ios_Hw2
//
//  Created by Yu Zhi on 2022/10/23.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct MusicView: View {//moon
    @State var play = true
    @State private var rotateDegree: Double = 0
    @State private var isRotated = false
    let player = AVPlayer()//生成播放音樂的 AVPlayer 物件。
    
    var body: some View {
        Button(action:{
            let fileUrl = Bundle.main.url(forResource:"Music",withExtension: "mp3")
            let playerItem = AVPlayerItem(url: fileUrl!)
            self.player.replaceCurrentItem(with: playerItem)
            self.play.toggle()
            self.isRotated.toggle()
            if self.play{
                self.player.pause()
                self.isRotated = true
            }else{
                self.player.play()
            }
            
        }) {if play{
            Image("Moon")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 30)
                }else{
                    Image("Moon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 30)
                        .rotationEffect(.degrees(rotateDegree))
                        .animation(
                            .linear(duration: 10)
                            .repeatForever(
                                autoreverses: false), value: rotateDegree
                            )
                        .onAppear{rotateDegree = 360
                        }
            }
        }
          
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}



