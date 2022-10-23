//
//  role.swift
//  ios_Hw2
//
//  Created by Yu Zhi on 2022/10/23.
//

import SwiftUI

struct role: View {
    var char : character
    var body: some View {
        VStack{
            Image(char.name)
                .resizable()
                .scaledToFill()
                .frame(width:89,height:80)
                .clipped()
                .mask(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.gray, lineWidth: 3))
            Text(char.name)
                .font(.system(size: 15))
                .foregroundColor(.secondary)
            Text(char.cname)
                //.padding()
                .font(.system(size: 15))
                .foregroundColor(.secondary)
        }.frame(height:200)
    }
}

struct role_Previews: PreviewProvider {
    static var previews: some View {
        role(char: .demochar)
    }
}
