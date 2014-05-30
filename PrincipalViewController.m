//
//  PrincipalViewController.m
//  MobileConf
//
//  Created by Fábio Pimentel on 5/29/14.
//  Copyright (c) 2014 fabiopimentel. All rights reserved.
//

#import "PrincipalViewController.h"
#import "ListaMotoTableViewController.h"


@interface PrincipalViewController ()

@end

@implementation PrincipalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)exibeTela:(id)sender {
    ListaMotoTableViewController * lista =[[ListaMotoTableViewController alloc]init];
    [self presentViewController:lista animated:YES completion:nil];
    
}
@end
