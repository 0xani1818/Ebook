//
//  HomePage.swift
//  ios_Hw2
//
//  Created by Yu Zhi on 2022/10/22.
//

import SwiftUI

struct HomePage: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        
            ZStack{
                Image("bg2")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
                    .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack{
                    Link("cyberpunk ",destination:URL(string: "https://www.cyberpunk.net/us/zh-tw/")!)
                            .font(Font.custom("Cyberpunk",size: 40))
                            .foregroundColor(.black)
                    Text("EDGERUNNERS").font(.title3)
                            .fontWeight(.semibold).italic()
                            .offset(x:100,y:2)
                    ScrollView{
                        cover()
                        VStack(spacing:3){
                            
                            Text("「我的月亮我的愛」")
                                .bold()
                                .font(.system(size: 20))
                                .padding(30)
                            Text(plot)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .frame(width: 350,height: 300)
                                .lineSpacing(10)
                        }
                        VStack(alignment:.leading,spacing: 10){
                            Text("延伸閱讀：")
                                //.font(.title)
                                .bold()
                                .font(.system(size: 20))
                            Text(extentopic)
                                .font(.system(size: 15))
                                .bold()
                                .lineLimit(2)
                            Text(more)
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .lineSpacing(10)
                                .padding()
                            Link("進入遊戲", destination:URL( string:"https://www.xbox.com/zh-TW/games/store/2077/BX3M8L83BBRW/0001")!)
                                
                            Spacer()
                        } .frame(width: 350,height: 500)
                        
                    }//scroll
                }
                MusicView()
                    .offset(x:160,y:300)
            }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct cover: View {
    var body: some View {
        TabView{
            ForEach(0..<6){ (index) in
                Image("detail\(index)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 200)
                    .cornerRadius(15)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(width: 500, height: 250)
    }
}
