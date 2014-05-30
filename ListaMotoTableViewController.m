//
//  ListaMotoTableViewController.m
//  MobileConf
//
//  Created by Fábio Pimentel on 5/30/14.
//  Copyright (c) 2014 fabiopimentel. All rights reserved.
//

#import "ListaMotoTableViewController.h"
#import "AFNetworking.h"
#import "Moto.h"
#import "UIImageView+AFNetworking.h"

@interface ListaMotoTableViewController ()

@property (strong) NSMutableArray * motos;

@end

@implementation ListaMotoTableViewController


-(void) mantemBarraDeStatusFixa
{
    [self.tableView setContentInset:UIEdgeInsetsMake(20, self.tableView.contentInset.left, self.tableView.contentInset.bottom, self.tableView.contentInset.right)];
    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (UITableViewController*)init
{
    self = [super init];
    if (self) {
        self.motos = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self mantemBarraDeStatusFixa];
    
    
    
    NSString *url = @"http://projetows.herokuapp.com/motos.json";

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        
        
        for (NSDictionary * dicionario in json) {
            
            Moto * moto = [[Moto alloc]init];
            
            moto.ano=[[dicionario objectForKey:@"apenas_ano"]integerValue];
            moto.marca= [dicionario objectForKey:@"marca"];
            moto.modelo= [dicionario objectForKey:@"modelo"];
            moto.imagemURL = [dicionario objectForKey:@"imagem_url"];
            
            NSLog(@"Moto %@", moto);
            [self.motos addObject:moto];
            
        }
        [self.tableView reloadData];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.motos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    Moto * moto = [self.motos objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:moto.modelo];
    [cell.detailTextLabel setText: moto.marca];
    [cell.imageView setImageWithURL:[NSURL URLWithString:moto.imagemURL] placeholderImage:[UIImage imageNamed:@"moto-icon.png"]];
    
    return cell;
}



@end
