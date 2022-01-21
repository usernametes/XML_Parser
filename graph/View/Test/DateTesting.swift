//
//  DateTesting.swift
//  graph
//
//  Created by MT on 2021/11/28.
//
import Foundation
import SwiftUI

private func StringToDate(dateSample:String) -> Date{
    //
    let formatter = DateFormatter()
    
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.dateFormat = "yyyy-MM-DD'T'HH:mm:ss.sssXXX"
    
    //let testdate =
    
    
    return formatter.date(from: dateSample) ?? Date()
}

private func CalculationDate(date1:Date,date2:Date)->Int{
    let calendar = Calendar(identifier: .gregorian)
    return calendar.dateComponents([.second], from:date1, to:date2).second ?? 0
}


struct DateView:View{
    let dateSample = "2021-10-17T20:26:58.000Z"
    let dateSample2 = "2021-10-17T21:30:05.000Z"
    var body: some View{
        
        let date = StringToDate(dateSample: dateSample)
        let date2 = StringToDate(dateSample: dateSample2)
        let prog = CalculationDate(date1: date, date2: date2)
        
        
        
        List{
            Text((prog/1037).description)
            Text(date.description)
        }
        
        
    }
}

struct DateTesting: View {
    var body: some View {
        DateView()
    }
    
    
    
}

struct DateTesting_Previews: PreviewProvider {
    static var previews: some View {
        DateTesting()
    }
}
