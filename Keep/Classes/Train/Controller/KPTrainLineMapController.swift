//
//  KPTrainLineMapController.swift
//  Keep
//
//  Created by Damon on 17/5/16.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPTrainLineMapController: KPBaseViewController {

    var search: AMapSearchAPI!
    var mapView: MAMapView!
    var startCoordinate: CLLocationCoordinate2D!
    var destinationCoordinate: CLLocationCoordinate2D!
    
    var route: AMapRoute?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AMapServices.shared().enableHTTPS = true
        
        mapView = MAMapView(frame: self.view.bounds)
        mapView.showsUserLocation = true;
        mapView.userTrackingMode = .follow
        mapView.allowsBackgroundLocationUpdates = true
        mapView.zoomLevel = 15.5
        mapView.distanceFilter = 3.0
        mapView.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        search = AMapSearchAPI()
        search?.delegate = self
        startCoordinate        = CLLocationCoordinate2DMake(22.546376410590277, 113.96541015625)
        destinationCoordinate  = CLLocationCoordinate2DMake(22.551358013798804, 113.95916862154984)
        
        let request = AMapWalkingRouteSearchRequest()
        request.origin = AMapGeoPoint.location(withLatitude: CGFloat(startCoordinate.latitude), longitude: CGFloat(startCoordinate.longitude))
        request.destination = AMapGeoPoint.location(withLatitude: CGFloat(destinationCoordinate.latitude), longitude: CGFloat(destinationCoordinate.longitude))
        search?.aMapWalkingRouteSearch(request)
    }
    
    func addDefaultAnnotations() {
        
        let anno = MAPointAnnotation()
        anno.coordinate = startCoordinate
        anno.title = "起点"
        
        mapView.addAnnotation(anno)
        
        let annod = MAPointAnnotation()
        annod.coordinate = destinationCoordinate
        annod.title = "终点"
        
        mapView.addAnnotation(annod)
    }
    
    func presentCurrentCourse() {
        
    }
}

extension KPTrainLineMapController: AMapSearchDelegate {

    func onRouteSearchDone(_ request: AMapRouteSearchBaseRequest!, response: AMapRouteSearchResponse!) {
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        
        addDefaultAnnotations()
        
        self.route = nil
        if response.count > 0 {
            
            self.route = response.route
            presentCurrentCourse()
            
            let path = response.route.paths[0]
            
            let step = path.steps[0]
            
            let overlays = self.mapView.overlays
            self.mapView.removeOverlays(overlays)
        }
    }

    func aMapSearchRequest(_ request: Any!, didFailWithError error: Error!) {
        print("Error:\(error)")
    }

}

extension KPTrainLineMapController: MAMapViewDelegate {

    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        
        if overlay.isKind(of: MAPolyline.self) {
            
            let polygonView = MAPolylineRenderer(polyline: overlay as! MAPolyline!)
            polygonView?.lineWidth = 8;
            polygonView?.strokeColor = UIColor(colorLiteralRed: 0.015, green: 0.658, blue: 0.986, alpha: 1.0)
            polygonView?.fillColor = UIColor(colorLiteralRed: 0.940, green: 0.771, blue: 0.143, alpha: 0.8)
            polygonView?.lineJoinType = kMALineJoinRound;
            return polygonView;
        }
        return nil
    }
    
}
