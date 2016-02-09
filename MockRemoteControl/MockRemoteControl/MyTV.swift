//
//  MyTV.swift
//  MockRemoteControl
//
//  Created by LIUJUNMIN on 2/1/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import Foundation

class MyTV: NSObject {
    
    // a timer to confirm the chanel change with single digit
    // touch 0 then no other input in 3 seconds, 
    // roll back to previous chanel
    // only touch 1-9 then no other input in 3 seconds, 
    // change the chanel to this digit
    private var confirmChanelTimer: NSTimer?
    private var confirmChanelSeconds = 3;
    
    override init() {
        super.init()
    }
    
    // change chanel
    // The range of the valid channels is from 1 to 99 (inclusive). Channels
    // are selected using two digits, including single digit channels. For example,
    // channel 7 is selected using ‘0’ and ‘7’ keys.
    func changeChanel(chanel: Int) {
        self.clearChanelChangeTimer()
        // if user has inputed a digit
        if let inputing = self._inputingChanel {
            // calculate the result and set to chanel
            self.chanel = inputing * 10 + chanel
            // set it to nil
            self._inputingChanel = nil
        } else {
            // the first time user input a digit
            self._inputingChanel = chanel
            // start the timer, in case user dose not input other digit
            self.confirmChanelTimer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(confirmChanelSeconds),
                target: self, selector: "confirmChanelChange", userInfo: nil, repeats: false)
        }
    }
    
    // confirm user's single digit input
    func confirmChanelChange()
    {
        if let inputing = _inputingChanel {
            if inputing > 0 {
                self.chanel = inputing
            }
        }
        self._inputingChanel = nil
        self.confirmChanelTimer = nil
    }
    
    // clear timer
    func clearChanelChangeTimer()
    {
        if let _ = self.confirmChanelTimer {
            self.confirmChanelTimer!.invalidate()
            self.confirmChanelTimer = nil;
        }
    }
    
    // increase the chanel, if current chanel is 99, then change it to 1
    func increaseChanel() {
        self.chanel = self.chanel == 99 ? 1 : self.chanel + 1
    }
    
    // decrease the chanel, if current chanel is 1, then change it to 99
    func decreaseChanel() {
        self.chanel = self.chanel == 1 ? 99 : self.chanel - 1
    }
    
    // switch changed handler
    var switchChanged: (Bool -> Void)?
    
    // volume changed handler
    var volumeChanged: (Int -> Void)?
    
    // chanel changed handler
    var chanelChanged: (Int -> Void)?
    
    // chanel display changed handler
    var chanelDisplayChanged: (String -> Void)?
    
    
    private var _inputingChanel:Int? = nil {
        didSet {
            if let _ = chanelDisplayChanged {
                chanelDisplayChanged!(chanelText)
            }
        }
    }
    
    // current chanel
    var chanel = 1 {
        didSet {
            if let _ = chanelChanged {
                chanelChanged!(chanel)
            }
            if let _ = self._inputingChanel {
                self.clearChanelChangeTimer()
                self._inputingChanel = nil
            } else {
                if let _ = chanelDisplayChanged {
                    chanelDisplayChanged!(chanelText)
                }
            }
        }
    }
    
    // the chanel displayed could be it's real chanel
    // or could be the digit touched
    var chanelText: String {
        get {
            if let _ = self._inputingChanel {
                return "\(self._inputingChanel!)"
            }
            return "\(self.chanel)"
        }
    }
    
    // if power is on
    var on = true {
        didSet {
            if let _ = switchChanged {
                switchChanged!(on)
            }
        }
    }
    
    // Speaker Volume
    var volume = 50 {
        didSet {
            if let _ = volumeChanged {
                volumeChanged!(volume)
            }
        }
    }
    
    
}