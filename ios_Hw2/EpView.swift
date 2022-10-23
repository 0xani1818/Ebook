//
//  EpView.swift
//  ios_Hw2
//
//  Created by Yu Zhi on 2022/10/22.
//

import SwiftUI
import AVKit
import AVFoundation

let player = AVPlayer()
struct EpView: View {
    var ep:episode
    var body: some View {
            VStack{
                let url = Bundle.main.url(forResource: "video", withExtension: "mov")!
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(width: 390, height: 230)
                Spacer()
                ScrollView{
                    LazyVStack{
                        ForEach(0..<video.count){(index)in
                            EpRow(ep:video[index])
                        }
                    }
                }
            }//vstack
            .background(Image("background1")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.3))
    }
}

struct EpView_Previews: PreviewProvider {
    static var previews: some View {
        EpView(ep:video[0])
    }
}

struct EpRow: View {
    var ep:episode
    var body: some View {
        HStack(spacing: 30 ){
            Image(ep.num)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 90)
                .clipped()
                .shadow(radius: 12)
            VStack(alignment:.leading){
            Text(ep.num)
                    .padding(4)
                    .foregroundColor(.white)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.665, opacity: 0.834))
                    .cornerRadius(4)
                   
            Text(ep.plot)
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    
            }
            Spacer()
        }
    }
}
