//
//  NameTextViewController.m
//  ConneX
//
//  Created by MBPinTheAir on 02/06/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "NameTextViewController.h"
#import "ModelTextViewController.h"

@interface NameTextViewController ()<UITextFieldDelegate,UINavigationControllerDelegate>

@end

@implementation NameTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning { [super didReceiveMemoryWarning]; }

- (IBAction)nextTapped:(id)sender
{
    self.anEquipment = [[CNXEquipment alloc]init];
    _anEquipment.eName = self.eNameTextfield.text;
    [self performSegueWithIdentifier:@"toModelSegue" sender:self];
//    [self.delegate returnEquipment:self.anEquipment];
//    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toModelSegue"])
    {
    UINavigationController *navController = (UINavigationController *) segue.destinationViewController;
    ModelTextViewController *mtVC = (ModelTextViewController *) navController.topViewController;
    mtVC.anEquipment = self.anEquipment;
    }
}

@end
