//
//  Third.swift
//  graph
//
//  Created by MT on 2021/11/28.
//

import Foundation
import SwiftUI

struct ThirdView:View{
    var name:String
    var gpxdata:gpx
    var body: some View{
        if(name == "HERAT RATE"){
            GraghView(gpxdata: gpxdata,Switch: name)
        }else if(name == "ELEVATION"){
            GraghView(gpxdata: gpxdata,Switch: name)
        }else if(name == "MAP"){
            MapView(gpxdata: gpxdata)
        }
        
    }
}

