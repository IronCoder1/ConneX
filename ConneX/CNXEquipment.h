//
//  Equipment.h
//  ConneX
//
//  Created by MBPinTheAir on 01/06/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CNXEquipment : NSObject
@property (copy, nonatomic) NSString *eModel, *eDescription, *eImageString, *eBrand, *eName;

@property (strong, nonatomic) UIImage *eImage;
@property (assign, nonatomic) float ePrice;


@end
