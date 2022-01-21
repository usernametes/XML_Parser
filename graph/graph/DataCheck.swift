//
//  DataCheck.swift
//  graph
//
//  Created by MT on 2021/11/25.
//

import SwiftUI
import Foundation

struct DataCheck: View {
    var data:XMLReader
    
    
    
    
    var body: some View {
        
        
        
        
        List{
            Text(data.data.hr[1].description)
            Text(data.data.hr.count.description)
            Text((data.data.time[7]).description)

        }
    }
}

struct DataCheck_Previews: PreviewProvider {
    //let name =
    static var previews: some View {
        DataCheck(data:XMLReader.init(names:"activity_7674806877.gpx"))
    }
}
