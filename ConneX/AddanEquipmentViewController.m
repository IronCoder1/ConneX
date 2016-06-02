//
//  AddanEquipmentViewController.m
//  ConneX
//
//  Created by MBPinTheAir on 01/06/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "AddanEquipmentViewController.h"
#import "EquipmentsTableViewController.h"




@interface AddanEquipmentViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
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

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [textField resignFirstResponder];
//    return YES;
//}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self performSegueWithIdentifier:@"toTextFieldSegue" sender:self];
    
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
    //pop for show, dismiss for modal
    [self.navigationController popViewControllerAnimated:YES];
}







#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"toTextFieldSegue"])
    {
        
    }
}


- (IBAction)addPhotoButton:(id)sender
{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Add Equipment photo" message:@"Please make a selection below" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    UIAlertAction *option1 = [UIAlertAction actionWithTitle:@"Use Camera" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action)
    {
        NSLog(@"Option 1 was tapped");
            picker.allowsEditing = NO;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:nil];
    }];
    
    UIAlertAction *option2 = [UIAlertAction actionWithTitle:@"Open Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        NSLog(@"Option 2 was tapped");
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *option3 = [UIAlertAction actionWithTitle:@"Open Photo Album" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        NSLog(@"Option 3 was tapped");
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    
    [actionSheet addAction:option1];
    [actionSheet addAction:option2];
    [actionSheet addAction:option3];
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}




#pragma mark  - private methods

-(NSString *)saveImageToDisk
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSUUID *uuID = [NSUUID UUID];
    NSString *secondBaseString = [NSString stringWithFormat:@"%@.png",[uuID UUIDString]];
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:secondBaseString];
    [UIImagePNGRepresentation(self.anEquipment.eImage) writeToFile:filePath atomically:YES];
    NSLog(@"file path %@", filePath);
    return filePath;
}

#pragma mark - ImagePicker Delegate Methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *itemImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
   self.anEquipment.eImageString = [self saveImageToDisk];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
