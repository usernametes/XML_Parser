import Foundation
import SwiftUI

class XMLReader: NSObject{
    
    var elementNameBuffer:String = ""
    var EndelementNameBuffer:String = ""
    var debag = ""
    var data = gpx()
    
    
    func LordData(name:String){
        let filePath = "/Users/mt/Documents/Activity/" + name
        let url:NSURL? = NSURL(fileURLWithPath: filePath)
        guard let parser = XMLParser(contentsOf: url! as URL) else{
            return
        }
        parser.delegate = self
        parser.parse()
        
    }
    
    override init(){
        super.init()
    }
    
    convenience init(names:String){
        self.init()
        LordData(name: names)
    }
    
    
}

extension XMLReader:XMLParserDelegate{
    func parserDidStartDocument(_ parser:XMLParser){
    }
    
    func parser(_ parser: XMLParser,
                didStartElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?,
                attributes attributeDict: [String : String] = [:]){
        elementNameBuffer = elementName
        
        if elementNameBuffer == "trkpt"{
            data.trkpt_lat.append(Double(attributeDict["lat"]!) ?? 0)
            data.trkpt_lon.append(Double(attributeDict["lon"]!) ?? 0)
        }
    }
    
    private func StringToDate(dateSample:String) -> Date{
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy-MM-DD'T'HH:mm:ss.sssXXX"
        
        return formatter.date(from: dateSample) ?? Date()
    }
    
    func parser(_ parser: XMLParser,
                foundCharacters buf: String){
        
        if("/" + elementNameBuffer == debag){
            return
        }
        
        if buf != "\n"{
            switch (elementNameBuffer){
            case "name":
                
                data.name.append(buf)
            case "time":
                data.time.append(StringToDate(dateSample: buf))
            case "ns3:hr":
                //data.hr.append(buf)
                data.hr.append(Int(buf) ?? 0)
            case "type":
                data.type.append(buf)
            case "ele":
                data.elevation.append(Double(buf) ?? 0)
            case "ns3:cad":
                data.cad.append(Int(buf) ?? 0)
            case "title":
                data.title.append(buf)
            default:
                break
            }
        }
    }
    
    func parser(_ parser: XMLParser,
                didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?){
        EndelementNameBuffer = elementName
        if(elementNameBuffer == EndelementNameBuffer){
            debag = "/" + elementName
        }
    }
    
    
    func parserDidEndDocument(_ parser: XMLParser){
        
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("エラー:" + parseError.localizedDescription)
    }
}






