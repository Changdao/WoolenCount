//
//  DealModel.swift
//  SWoolenCount
//
//  Created by Jidong Liu on 15/2/26.
//  Copyright (c) 2015年 Hollo.cn. All rights reserved.
//

import Foundation

class WCPlayer:NSObject {
    var name:String?
    var count:Int?
    var currentLocation:Int?
}


class WCDeal:NSObject {
    //1:east, 2:south 3:w 4:n
    var count = ["east":0,"south":0,"west":0,"north":0]
    var locations = [1:"",2:"",3:"",4:""]
    
    func balance() -> Int{
        return count["east"]! + count["south"]! + count["west"]! + count["north"]!
    }
}

