import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


class ElectricKettle {
    var timer: Timer?
    var count: Int = 0
    var limit: Int = 0
    
    func start(liter: Int, time: Int) {
        limit = time
        print("\(liter)Lで\(calctime(time: time))分の温めを開始します")
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countup),
            userInfo: nil,
            repeats: true
        )
    }
    
    func calctime(time: Int) -> Int {
        return time / 60
    }
    
    @objc func countup() {
        //今回は60秒まで行く処理
        count += 1
        
        if count % 10 == 0 {
            print("\(count)秒経過")
            
            if limit <= count {
                print("カチッと音が鳴る")
                
                timer?.invalidate()
            }
        }
    }
}

let electrickettle = ElectricKettle()
electrickettle.start(liter: 1,time: 180)
