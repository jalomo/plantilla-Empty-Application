//
//  mainController.m
//  test
//
//  Created by Gregorio Jalomo Larios on 11/01/15.
//  Copyright (c) 2015 xcreenlab. All rights reserved.
//

#import "mainController.h"

@interface mainController ()
@property (weak, nonatomic) IBOutlet UITableView *tabla;

@end

@implementation mainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [NSThread detachNewThreadSelector:@selector(descarga) toTarget:self withObject:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;    //count number of row from counting array hear cataGorry is An Array
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:MyIdentifier];
    }
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
    //cell.textLabel.text = @"My Text";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*detailController *detail = [[detailController alloc]initWithNibName:@"detailController" bundle:nil];
    detail.titulo = self.data[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
    */
    
    
}

-(void)descarga{

    NSString *sUrl = [NSString stringWithFormat:@"http://zavordigital.com/galerias_pachuca/inicio.php/mobiles/GetAllStoresMarketPlace_V1"];
    NSURL *url = [NSURL URLWithString:sUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSData *requestBody = [@"username:x&password:y" dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:requestBody];
    NSURLResponse *response = NULL;
    NSError *requestError = NULL;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
    //NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSArray *readJsonArray = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    
    NSLog(@"PLANTA %@", readJsonArray);

}

@end
