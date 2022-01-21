//
//  GPX.swift
//  GPX
//
//  Created by MT on 2021/10/23.
//

import Foundation

struct gpx: Codable, Hashable{
    var ID = UUID()
    var name: [String]
    var sdate: [String]
    var type: [String]
    var trkpt_lat: [Double]
    var trkpt_lon: [Double]
    var elevation: [Double]
    var time: [Date]
    var hr: [Int]
    var cad: [Int]
    var title:[String]
    
    init(){
        name = [String]()
        sdate = [String]()
        type = [String]()
        trkpt_lat = [Double]()
        trkpt_lon = [Double]()
        elevation = [Double]()
        time = [Date]()
        hr = [Int]()
        cad = [Int]()
        title = [String]()
    }

    
    
}
