//
//  SecondVIew.swift
//  graph
//
//  Created by MT on 2021/11/28.
//

import SwiftUI

struct SecondView: View {
    var name: String
    var body:some View{
        let gpxdata = XMLReader(names:name)
        let list = ["HERAT RATE", "ELEVATION","MAP"]
        
        List{
            ForEach(list, id:\.self){
                mg in NavigationLink(destination: ThirdView(name: mg, gpxdata:gpxdata.data)){
                    Text(mg)
                }
            }
        }.navigationTitle(gpxdata.data.name[0])
        
        
    }
    
}
