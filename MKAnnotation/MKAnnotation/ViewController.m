//
//  ViewController.m
//  MKAnnotation
//
//  Created by  江苏 on 16/5/19.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "JSAnnotation.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

/*地理编码*/
@property(strong,nonatomic)CLGeocoder* geoCoder;

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取手点击地图的点
    CGPoint point=[[touches anyObject] locationInView:self.mapView];
    //转换成经纬度
    CLLocationCoordinate2D lc=[self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    
    //创建大头针
    [self addAnnotatitonWithCLLocationCoordinate2D:lc];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray* arr=self.mapView.annotations;
    [self.mapView removeAnnotations:arr];
}

-(void)addAnnotatitonWithCLLocationCoordinate2D:(CLLocationCoordinate2D)lc{
   
    JSAnnotation* anno=[[JSAnnotation alloc]init];
    
    anno.coordinate=lc;
    
    CLLocation *location=[[CLLocation alloc]initWithLatitude:lc.latitude longitude:lc.longitude];
    
    [self.geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark* placemark=[placemarks firstObject];
        
        anno.title=placemark.locality;
        
        anno.subtitle=placemark.thoroughfare;
    }];
    
    [self.mapView addAnnotation:anno];
}
@end
