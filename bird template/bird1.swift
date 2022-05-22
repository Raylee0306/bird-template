//
//  planttest.swift
//  bird template
//
//  Created by Jack on 2022/5/14.
//

import SwiftUI
import AVFoundation



struct bird1: View { //struct寫bird加一個數字
    let birdnumber :String
    let birdname :String //鳥類名稱
    let birdname_ :String //鳥類別名
    let synthesizer = AVSpeechSynthesizer() //語音導覽
    @State private var voicestatus :Int? = 0 //語音導覽狀態
    let player = AVPlayer() //鳥叫聲
    var body: some View {
        Spacer()
        ScrollView{
            VStack{
                HStack{
                    //鳥類名稱要改
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
                                //文字敘述要改
                                let utterance = AVSpeechUtterance(string: "頭頂白色，頭側、後頭和冠羽黑色。喉、頸灰白色，前頸有2至3列黑色縱斑，下頸前部有總狀白色飾羽，肩羽總狀。體背蒼灰白色，初級和次級飛羽灰黑色，翼上覆羽淺灰白色。胸、腹和尾下覆羽白色，胸側和腹側有黑斑。虹膜：黃色。嘴：橘黃。跗蹠：黃褐色。腳：灰褐色。成鳥：頭後飾羽及過眼線黑色。性孤僻，主食魚類，兩棲類和各種小動物。低沉粗啞喉音")
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
                    //let fileUrl = URL(string: "./鳥類音檔/"+birdnumber+".mp3")!
                    let playerItem = AVPlayerItem(url: fileUrl)
                    Button{
                        //改成你的音檔檔名和副檔名
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
                    //下方為文字敘述 跟上面可以放同樣的敘述
                    VStack(alignment: .leading) {
                        Text("•頭頂白色，頭側、後頭和冠羽黑色").padding(.bottom)
                        Text("•喉、頸灰白色，前頸有2至3列黑色縱斑，下頸前部有總狀白色飾羽，肩羽總狀").padding(.bottom)
                        Text("•體背蒼灰白色，初級和次級飛羽灰黑色，翼上覆羽淺灰白色").padding(.bottom)
                        Text("•胸、腹和尾下覆羽白色，胸側和腹側有黑斑").padding(.bottom)
                        Text("•虹膜：黃色").padding(.bottom)
                        Text("•嘴：橘黃").padding(.bottom)
                        Text("•跗蹠：黃褐色").padding(.bottom)
                        Text("•腳：灰褐色").padding(.bottom)
                        Text("•成鳥：頭後飾羽及過眼線黑色").padding(.bottom)
                        Text("•性孤僻，主食魚類，兩棲類和各種小動物").padding(.bottom)
                    }.padding()
                    /*
                    
                    Text("頭頂白色，頭側、後頭和冠羽黑色\n喉、頸灰白色，前頸有2至3列黑色縱斑，下頸前部有總狀白色飾羽，肩羽總狀\n體背蒼灰白色，初級和次級飛羽灰黑色，翼上覆羽淺灰白色\n胸、腹和尾下覆羽白色，胸側和腹側有黑斑\n虹膜：黃色\n嘴：橘黃\n跗蹠：黃褐色\n腳：灰褐色\n成鳥：頭後飾羽及過眼線黑色\n性孤僻，主食魚類，兩棲類和各種小動物\n低沉粗啞喉音\n")
                     */
                    
                }.font(.system(size: 25, design: .rounded))
                    .foregroundColor(.black)
                    .padding()
                
                
                DisclosureGroup("圖片"){
                    //鳥圖檔名
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
                        Link("https://taieol.tw/pages/74153", destination: URL(string: "https://taieol.tw/pages/74153")!)
                        Spacer(minLength: 25)
                        Text("2. 音檔來源")
                        Link("https://xeno-canto.org/723780\n", destination: URL(string: "https://xeno-canto.org/723780")!)
                            
                    }.padding()
                }.font(.system(size: 25, design: .rounded))
                    .foregroundColor(.black).padding()
                
                
            }
        }
    }
}

/*
struct bird1_Previews: PreviewProvider {
    static var previews: some View {
        //這邊一樣bird加數字 bird加英文字母 與上面相同
        bird1(birdnumber: "1", birdname: "蒼鷺", birdname_: "灰鷺")
    }
}
*/
