//
//  DVR.swift
//  Mock Remote Control III
//
//  Created by LIUJUNMIN on 2/22/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import Foundation


// all dvr states
enum DVRState {
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


class DVR: NSObject {
    
    override init() {
        super.init()
    }
    
    static let mine = DVR()
    
    // switch changed handler
    var switchChanged: (Bool -> Void)?
    
    // state changed handler
    var stateChanged: (DVRState -> Void)?
    
    // current state
    var state: DVRState = .Stopped {
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