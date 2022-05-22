//
//  birdmenu.swift
//  bird template
//
//  Created by RAY on 2022/5/21.
//

import SwiftUI

struct birdmenu: View {
    let birdname1 :String = "蒼鷺"
    let birdname2 :String = "唐白鷺"
    var body: some View{
        NavigationView{
            List{
                //NavigationLink(birdname1, destination: bird1(birdnumber: "1", birdname: birdname1, birdname_: "灰鷺"))
                NavigationLink(birdname1){
                    bird1(birdnumber: "1", birdname: birdname1, birdname_: "灰鷺")
                }
                //NavigationLink(birdname2, destination: bird2(birdnumber: "2", birdname: birdname2, birdname_: "黃嘴白鷺"))
                NavigationLink(birdname2){
                    bird2(birdnumber: "2", birdname: birdname2, birdname_: "黃嘴白鷺")
                }
            }   .background(Color(UIColor.secondarySystemBackground))
                .navigationTitle("bird")
        }
        
    }
}
/*
struct birdmenu_Previews: PreviewProvider {
    static var previews: some View {
        birdmenu()
    }
}
*/
