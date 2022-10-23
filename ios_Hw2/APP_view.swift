//
//  APP_view.swift
//  ios_Hw2
//
//  Created by Yu Zhi on 2022/10/22.
//

import SwiftUI

struct APP_view: View {
    let char:character
    var body: some View {
        
            TabView{
                    HomePage()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("主頁")
                        }
                    RoleView(char: walker[0])
                        .tabItem {
                            Image(systemName:"person.3.fill")
                            Text("角色介紹")
                        }
                    EpView(ep:video[0])
                        .tabItem {
                            Image(systemName:"play.rectangle.fill")
                            Text("劇情簡介")
                                .lineLimit(nil)
                    }
                    Song(song: playsong[0])
                    .tabItem {
                        Image(systemName: "info.circle.fill")
                            Text("更多")
                    }
            }
    }
}

struct APP_view_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            APP_view(char: .demochar)
            APP_view(char: .demochar)
        }
    }
}

extension character{
    static let demochar = character(name: "Rebecca", intro: "魅音團隊成員之一，擅長各種槍械的犯險者。霹拉的妹妹，在拯救露西的行動中遭從天而降的亞當碎骨砸死。", cname: "蕾貝卡")
}
