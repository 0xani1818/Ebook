//
//  RoleView.swift
//  ios_Hw2
//
//  Created by Yu Zhi on 2022/10/23.
//

import SwiftUI

struct RoleView: View {
    var char : character
    var body: some View {
        NavigationView{
                List{
                    Section(header:Header1(name:"邊緣行者")){
                        ScrollView(.horizontal){
                            HStack(spacing: 10.0){
                                ForEach(0..<walker.count){(index) in
                                    NavigationLink(
                                        destination:actor_detail(char:walker[index])){
                                            role(char: walker[index])
                                    }
                                }
                            }
                        }.frame(height:150)
                    }
                    Section(header:Header1(name:"荒坂集團")){
                        ScrollView(.horizontal){
                            HStack(spacing: 10.0){
                                ForEach(0..<con.count){(index) in
                                    NavigationLink(
                                        destination:actor_detail(char:con[index])){
                                            role(char: con[index])
                                        }
                                    }
                                }
                            }.frame(height:150)
                        }
                    Section(header:Header1(name:"其他")){
                        ScrollView(.horizontal){
                            HStack(spacing: 10.0){
                                ForEach(0..<other.count){(index) in
                                    NavigationLink(
                                        destination:actor_detail(char:other[index])){
                                            role(char: other[index])
                                    }
                                }
                            }
                        }.frame(height:150)
                    }
                }
                .navigationBarTitle("角色介紹")
                .buttonStyle(PlainButtonStyle())
        }
    }
}

struct RoleView_Previews: PreviewProvider {
    static var previews: some View {
        RoleView(char: .demochar)
    }
}

struct Header1: View {
    let name: String
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("sand1"), Color("sand")]), startPoint: .leading, endPoint: .trailing)
            HStack {
                Text(name)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color(hue: 0.11, saturation: 0.312, brightness: 0.451))
                Spacer()
            }
            .frame(width: 370)
            Spacer()
        }.frame(width: 410,height: 50)
         .offset(y:-15)
    }
}

