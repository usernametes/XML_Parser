//
//  GpxViewer.swift
//  GPX
//
//  Created by MT on 2021/11/12.
//

import SwiftUI

struct GpxViewer: View {
    let gpxdata: XMLReader
   // let viewcont:ViewController
    
       
    var body: some View {
        Text(gpxdata.data.hr[3].description)
    }
}

struct GpxViewer_Previews: PreviewProvider {
    static var previews: some View {
        GpxViewer(gpxdata: XMLReader.init())
    }
}
