//
//  AddanEquipmentViewController.h
//  ConneX
//
//  Created by MBPinTheAir on 01/06/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNXEquipment.h"


@protocol AddanEquipmentViewControllerDelegate<NSObject>

-(void)returnEquipment:(CNXEquipment *)myEquipment;

@end

@interface AddanEquipmentViewController : UIViewController

@property (nonatomic, weak)id<AddanEquipmentViewControllerDelegate>delegate;


@end
