//
//  MapView.swift
//  graph
//
//  Created by MT on 2021/11/26.
//


//struct MapLine:UIViewRepresentable{


//}


import SwiftUI
import MapKit
import Foundation

/*class ViewController: UIViewController {
 
 override func viewDidLoad() -> super.MKMapView{
 super.viewDidLoad()
 
 let mapView = MKMapView()
 mapView.frame = view.bounds
 mapView.delegate = self
 view.addSubview(mapView)
 
 let coordinates: [CLLocationCoordinate2D]  = [
 CLLocationCoordinate2D(latitude: 35.6804, longitude: 139.7690),
 CLLocationCoordinate2D(latitude: 36.2380, longitude: 137.9720),
 CLLocationCoordinate2D(latitude: 34.6937, longitude: 135.5023),
 ]
 let polyLine = MKPolyline(coordinates: coordinates, count: coordinates.count)
 mapView.addOverlay(polyLine)
 
 return mapView
 }
 }
 
 extension ViewController: MKMapViewDelegate {
 func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
 if let polyline = overlay as? MKPolyline {
 let polylineRenderer = MKPolylineRenderer(polyline: polyline)
 polylineRenderer.strokeColor = .blue
 polylineRenderer.lineWidth = 2.0
 return polylineRenderer
 }
 return MKOverlayRenderer()
 }
 }*/


struct MapLineView:UIViewRepresentable{
    
    typealias UIViewType = MKMapView
    
    var gpxdata:gpx
    
    //typealias UIViewType = MKMapView
    
    func makeUIView(context:UIViewRepresentableContext<MapLineView>) -> MKMapView{
        let mkmap = MKMapView()
        mkmap.delegate = context.coordinator
        
        var coordinates = [CLLocationCoordinate2D]()
        
        for cnt in 0..<gpxdata.trkpt_lon.count{
            coordinates.append(CLLocationCoordinate2D(latitude: gpxdata.trkpt_lat[cnt], longitude: gpxdata.trkpt_lon[cnt]))
        }
        
        let polyLine = MKPolyline(coordinates: coordinates, count: coordinates.count)
        mkmap.addOverlay(polyLine)
        
        return mkmap
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude:(gpxdata.trkpt_lat.last! + gpxdata.trkpt_lat[0])/2,longitude:(gpxdata.trkpt_lon.last! + gpxdata.trkpt_lon[0])/2)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
    }
    
    class Coordinator:NSObject, MKMapViewDelegate{
        var parent:MapLineView
        
        init(_ parent:MapLineView){
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let polylineRenderer = MKPolylineRenderer(polyline: polyline)
                polylineRenderer.strokeColor = .blue
                polylineRenderer.lineWidth = 2.0
                return polylineRenderer
            }
            return MKOverlayRenderer()
        }
        
        
        
        
    }
    
    
}


struct MapView: View {
    var gpxdata:gpx
    var body: some View{
        MapLineView(gpxdata:gpxdata)
    }
    
}



