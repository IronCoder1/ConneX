//
//  AddanEquipmentViewController.m
//  ConneX
//
//  Created by MBPinTheAir on 01/06/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "AddanEquipmentViewController.h"
#import "EquipmentsTableViewController.h"




@interface AddanEquipmentViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *eNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *eModelTextfield;
@property (weak, nonatomic) IBOutlet UITextField *eBrandTextfield;
@property (weak, nonatomic) IBOutlet UITextField *eDescTextfield;
@property (weak, nonatomic) IBOutlet UITextField *eRateTextfield;
- (IBAction)addPhotoButton:(id)sender;
@property (strong, nonatomic) CNXEquipment *anEquipment;

@end

@implementation AddanEquipmentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![self.eNameTextfield.text isEqualToString:@""] && ![self.eRateTextfield.text isEqualToString:@""])
    {
    [textField resignFirstResponder];
    }
    else
    {
        // show alert
    }
    return YES;
}

- (IBAction)saveEqiup:(id)sender
{
    
    self.anEquipment = [[CNXEquipment alloc]init];
    
    _anEquipment.eName = self.eNameTextfield.text;
    _anEquipment.eModel = self.eModelTextfield.text;
    _anEquipment.eBrand = self.eBrandTextfield.text;
    _anEquipment.eDescription = self.eDescTextfield.text;
    _anEquipment.ePrice = [self.eRateTextfield.text floatValue];
    
    [self.delegate returnEquipment:self.anEquipment];
    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addPhotoButton:(id)sender
{
    
}
@end
