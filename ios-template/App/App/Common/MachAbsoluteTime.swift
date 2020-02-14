//
//  MachAbsoluteTime.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 11/19/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation

//based off of https://gist.github.com/cemolcay/e8e3cad64da65cd80a50ed37310d2038
class MachAbsoluteTime {
    // the timebase should never change
    private static var timebaseInfo = mach_timebase_info_data_t()
    private static var initialized = false
    
    class func setupTimebase() {
        if !initialized {
            mach_timebase_info(&timebaseInfo)
            initialized = true
        }
    }
    
    class func machAbsoluteToSeconds(machAbsolute: UInt64 = mach_absolute_time()) -> Double {
        setupTimebase()
        let nanos = Double(machAbsolute * UInt64(MachAbsoluteTime.timebaseInfo.numer)) / Double(MachAbsoluteTime.timebaseInfo.denom)
        return nanos / 1.0e9;
    }
}
