//
//  File.swift
//  MockRemoteControl
//
//  Created by LIUJUNMIN on 2/15/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import Foundation

// all dvr states
enum MyDVRState {
    case Stopped
    case Playing
    case Paused
    case FastForwarding
    case FastRewinding
    case Recording
    
    
    var description : String {
        switch self {
        case .Stopped: return "Stopped";
        case .Playing: return "Playing";
        case .Paused: return "Paused";
        case .FastForwarding: return "Fast forwarding";
        case .FastRewinding: return "Fast rewinding";
        case .Recording: return "Recording";
        }
    }
}


class MyDVR: NSObject {
    
    override init() {
        super.init()
    }
    
    
    // switch changed handler
    var switchChanged: (Bool -> Void)?
    
    // state changed handler
    var stateChanged: (MyDVRState -> Void)?
    
    // current state
    var state: MyDVRState = .Stopped {
        didSet {
            if let _ = stateChanged {
                stateChanged!(state)
            }
        }
    }
    
    // if power is on
    var on = true {
        didSet {
            self.state = .Stopped
            if let _ = switchChanged {
                switchChanged!(on)
            }
        }
    }
    
}