//
//  NameTextViewController.h
//  ConneX
//
//  Created by MBPinTheAir on 02/06/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNXEquipment.h"
#import "AddanEquipmentViewController.h"
#import "EquipmentsTableViewController.h"

@protocol NameTextViewControllerDelegate<NSObject>

-(void)returnEquipment:(CNXEquipment *)myEquipment;

@end

@interface NameTextViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *eNameTextfield;
@property (strong, nonatomic) CNXEquipment *anEquipment;
@property (nonatomic, weak)id<NameTextViewControllerDelegate>delegate;
@end
