//
//  actor_detail.swift
//  ios_Hw2
//
//  Created by Yu Zhi on 2022/10/22.
//

import SwiftUI

struct actor_detail: View {
    @State var showpic = false
    var char:character
    var body: some View {
        ZStack{
            Image("background1")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
                .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity)
                .ignoresSafeArea()
            VStack{
                if showpic{
                    ScrollView{
                        VStack(alignment:.center){
                            Image(char.name)
                                .resizable()
                                .scaledToFill()
                                .frame(width:250, height: 320)
                                .clipped()
                                .border(Color.black, width: 5)
                                .navigationTitle(char.name)
                                .navigationBarTitleDisplayMode(.inline)
                                .animation(.easeIn(duration: 1))
                            Text(char.intro)
                                .lineSpacing(10)
                                .padding(15)
                        }
                        Spacer()
                    }.transition(.slide)
                    
                }
            }//vstack
            .animation(.linear(duration:1.5))
                   .onAppear {
                       self.showpic = true
                   }
                   .onDisappear {
                       self.showpic = false
                   }
        }
    }
}

struct actor_detail_Previews: PreviewProvider {
    static var previews: some View {
        actor_detail(char:walker[1])
    }
}


