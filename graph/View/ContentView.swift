//
//  ContentView.swift
//  graph
//
//  Created by MT on 2021/11/15.
//
import SwiftUI


private func FileNameGetter() -> [String]{
    do{
        let filemanager = FileManager.default
        let fileNames = try filemanager.contentsOfDirectory(atPath: "/Users/mt/Documents/Activity")
        
        return fileNames
    }catch{
        print(error)
        return []
    }
}


struct ContentView: View {
    let fileNames = FileNameGetter()
    var body: some View {
        
        NavigationView{
            List{
                ForEach(fileNames, id:\.self){
                    mg in NavigationLink(destination: SecondView(name: mg)){
                        Text(mg)
                            .fixedSize()
                    }
                }
            }.navigationTitle("Activity menu")
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
