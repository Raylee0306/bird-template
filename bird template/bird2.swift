//
//  bird2.swift
//  bird template
//
//  Created by RAY on 2022/5/21.
//

import SwiftUI
import AVFoundation



struct bird2: View { //struct寫bird加一個數字
    let birdnumber :String
    let birdname :String //鳥類名稱
    let birdname_ :String //鳥類別名
    let birdinfo :String = "全身白色。枕部有飾羽；肩部、下頸及胸披簑羽。夏季喙黃色；腳黑色，趾黃色；眼先裸出部藍色。冬季飾羽和簑羽均脫落；喙黑褐色，下喙基部黃色；跗蹠和趾黃綠色；眼先裸出部黃色。"
    let birdlink1 :String = "https://taieol.tw/pages/72657"
    let birdlink2 :String = "https://macaulaylibrary.org/zh/asset/368396971"
    let synthesizer = AVSpeechSynthesizer() //語音導覽
    @State private var voicestatus :Int? = 0 //語音導覽狀態
    let player = AVPlayer() //鳥叫聲
    var body: some View {
        Spacer()
        ScrollView{
            VStack{
                HStack{
                    Text(birdname)
                        .foregroundColor(.black)
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .padding()
                    
                    if birdname_ != "0"{
                        Text(birdname_)
                            .font(.system(size: 20, design: .rounded))
                            .foregroundColor(.black)
                    }

                }
            
                DisclosureGroup("語音導覽"){
                    HStack{
                        if voicestatus == 0 {
                            Button{
                                let utterance = AVSpeechUtterance(string: birdinfo)
                                utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
                                utterance.rate = 0.4
                                synthesizer.speak(utterance)
                                voicestatus = 1
                            } label: {
                                Text("播放")
                                Image(systemName: "play.circle")
                            }
                        }else if voicestatus == 1 {
                            Button{
                                synthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
                                voicestatus = 2
                            } label: {
                                Text("暫停")
                                Image(systemName: "pause.circle")
                            }
                        }else if voicestatus == 2{
                            Button{
                                synthesizer.continueSpeaking()
                                voicestatus = 1
                            } label: {
                                Text("繼續")
                                Image(systemName: "play.circle")
                            }
                        }
                        Button{
                            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
                            voicestatus = 0;
                        } label: {
                            Text("  停止")
                            Image(systemName: "stop.circle")
                        }
                    }
                }.font(.system(size: 25, design: .rounded))
                        .foregroundColor(.black).padding()
                        

                DisclosureGroup("鳥叫聲"){
                    let fileUrl = Bundle.main.url(forResource: birdnumber, withExtension: ".mp3")!
                    let playerItem = AVPlayerItem(url: fileUrl)
                    Button{
                        self.player.replaceCurrentItem(with: playerItem)
                        self.player.play()
                        self.player.volume = 5
                        
                    } label: {
                        Text("播放")
                        Image(systemName: "play.circle")
                    }
                }.font(.system(size: 25, design: .rounded))
                    .foregroundColor(.black)
                    .padding()
                
               
                DisclosureGroup("相關知識"){
                    VStack(alignment: .leading) {
                        Text("  "+birdinfo).padding(.bottom)
                        
                    }.padding()
                    
                    
                }.font(.system(size: 25, design: .rounded))
                    .foregroundColor(.black)
                    .padding()
                
                
                DisclosureGroup("圖片"){
                    Image(birdnumber + "-1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                    Spacer(minLength: 25)
                    Image(birdnumber + "-2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                    Spacer(minLength: 25)
                    Image(birdnumber + "-3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                    Spacer(minLength: 25)
                    Image(birdnumber + "-4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                    Spacer(minLength: 25)
                    
                }.font(.system(size: 25, design: .rounded))
                    .foregroundColor(.black)
                    .padding()
                
                
                DisclosureGroup("資料來源"){
                    VStack(alignment: .leading) {
                        Text("1. 圖文資料來源")
                        Link(birdlink1, destination: URL(string: birdlink1)!)
                            .foregroundColor(.blue)
                        Spacer(minLength: 25)
                        Text("2. 音檔來源")
                        Link(birdlink2
                             , destination: URL(string: birdlink2)!)
                            .foregroundColor(.blue)
                            
                    }.padding()
                }.font(.system(size: 25, design: .rounded))
                    .foregroundColor(.black).padding()
                
                
            }
        }
    }
}

/*
struct bird2_Previews: PreviewProvider {
    static var previews: some View {
        //這邊一樣bird加數字 bird加英文字母 與上面相同
        bird2(birdnumber: "2", birdname: birdname, birdname_: "黃嘴白鷺")
    }
}
*/
