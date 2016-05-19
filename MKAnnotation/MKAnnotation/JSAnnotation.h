//
//  JSAnnotation.h
//  MKAnnotation
//
//  Created by  江苏 on 16/5/19.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface JSAnnotation : NSObject< MKAnnotation>

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

@property (nonatomic,  copy, nullable) NSString *title;

@property (nonatomic, copy, nullable) NSString *subtitle;

@end
