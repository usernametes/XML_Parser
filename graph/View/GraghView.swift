//
//  GraghView.swift
//  graph
//
//  Created by MT on 2021/11/25.
//

import SwiftUI
import Charts
import Foundation
import UIKit








private func CalculationDate(date1:Date,date2:Date)->Int{
    let calendar = Calendar(identifier: .gregorian)
    
    return calendar.dateComponents([.second], from:date1, to:date2).second ?? 0
}



struct LineChart : UIViewRepresentable {
    let gpxdata:gpx
    let Switch:String
    
    func makeUIView(context: Context) -> LineChartView {
        
        let lineChartView = LineChartView()
        lineChartView.data = setData()
        
        //xAxisのフォーマット用
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm:ss"
        var startDate:Date
        
        
        
        lineChartView.backgroundColor = .darkGray //バックグラウンドカラーの変更
        lineChartView.data!.setValueFont(.systemFont(ofSize: 20, weight: .light)) //データのフォントサイズとウエイトの変更
        lineChartView.data!.setValueTextColor(.white)
        lineChartView.data!.setDrawValues(false) //データの値表示（falseに設定すると非表示）
        lineChartView.rightAxis.enabled = false //右側のX軸非表示
        
        //Y軸表示の設定
        let yAxis = lineChartView.leftAxis // lineChartView.leftAxisを変数で定義
        yAxis.labelFont = .boldSystemFont(ofSize: 12) //Y軸単位のフォントサイズ
        yAxis.setLabelCount(5, force: false) //Y軸の表示罫線数（falseにすると指定無し）
        yAxis.labelTextColor = .white //Y軸単位のテキストカラー
        yAxis.axisLineColor = .white //Y軸単位の軸のカラー
        yAxis.labelPosition = .outsideChart //Y軸単位のポジション(.insideChartにすると内側で表示)
        
    
        //X軸表示の設定
        let xAxis = lineChartView.xAxis // lineChartView.xAxisを変数で定義
        xAxis.labelPosition = .bottom //X軸単位のポジション(下部に表示)
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.setLabelCount(5, force: true)
        xAxis.labelTextColor = .white
        xAxis.axisLineColor = .white
        xAxis.granularity = 100.0
        //xAxis.valueFormatter = MyValueFormatter()
        
        /*class DateValueFormatter: NSObject, IAxisValueFormatter {
         
         as! AxisValueFormatter
         
         init(startDate:Date) {
         self.startDate = startDate
         }
         
         public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
         let modifiedDate = Calendar.current.date(byAdding: .day, value: Int(value), to: startDate )!
         
         return dateFormatter.string(from: modifiedDate)
         }
         }*/
        
        return lineChartView
    }
    func updateUIView(_ uiView: LineChartView, context: Context) {
        
    }
    
    let yValue:[ChartDataEntry] = []
    
    func getDataPoints(accuracy: [ChartDataEntry]) -> [ChartDataEntry] {
        var dataPoints: [ChartDataEntry] = []
        //let baseDate  = gpxdata.time[0]    CalculationDate(date1:baseDate,date2:gpxdata.time[count])
        
        if(Switch == "HERAT RATE"){
            for count in (0..<gpxdata.hr.count) {
                dataPoints.append(ChartDataEntry(x: Double(3*count), y: Double(gpxdata.hr[count])))
            }
        }else if(Switch == "ELEVATION"){
            for count in (0..<gpxdata.elevation.count) {
                dataPoints.append(ChartDataEntry(x: Double(3*count), y: Double(gpxdata.elevation[count])))
            }
        }
        
        return dataPoints
    }
    
    func setData() -> LineChartData{
        
        let dataPoint = getDataPoints(accuracy: yValue)
        
        let set = LineChartDataSet(entries: dataPoint, label: "My data")
        let data = LineChartData(dataSet: set)
        
        
        //set.mode = .cubicBezier //線表示を曲線で表示
        set.drawCirclesEnabled = false
        
        
        return data
    }
    
    
    
    
    
    
}




struct GraghView: View {
    var gpxdata :gpx
    var Switch:String
    var body: some View {
        LineChart(gpxdata: gpxdata, Switch: Switch)
    }
}

