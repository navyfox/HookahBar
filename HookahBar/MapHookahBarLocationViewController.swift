//
//  MapHookahBarLocationViewController.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 20.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import UIKit
import MapKit

class MapHookahBarLocationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    var hookahBar: HookahBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self

        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(hookahBar.location, completionHandler: { placemarks, error in
            if error != nil {
                print(error)
                return
            }
            if let placemark = placemarks?[0] {
                let annotation = MKPointAnnotation()
                annotation.title = self.hookahBar.name
                annotation.subtitle = self.hookahBar.type
                annotation.coordinate = placemark.location!.coordinate

                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }

        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        //создаем аннотацию
        //идентификатор

        let identifier = "CurrentPin"

        if annotation.isKindOfClass(MKUserLocation){
            return nil
        }

        //ищем свободные аннотации
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        }

        //добавляем изображение к аннотации

        let leftSideAnnotationView = UIImageView(frame: CGRectMake(0, 0, 52, 52))
        leftSideAnnotationView.image = UIImage(named: hookahBar.image)
        annotationView!.leftCalloutAccessoryView = leftSideAnnotationView
        
        return annotationView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
