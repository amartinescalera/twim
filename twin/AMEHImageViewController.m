//
//  AMEHImageViewController.m
//  twin
//
//  Created by Antonio Martin on 19/01/2015.
//  Copyright (c) 2015 antoniomeh. All rights reserved.
//

#import "AMEHImageViewController.h"

@interface AMEHImageViewController ()

@end

@implementation AMEHImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) imageWith:(void (^) (UIImage *image)) completionBlock {
    //Download the image en second
    dispatch_queue_t download = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_async(download, ^{
        NSURL *url = [NSURL URLWithString:@"http://elhorizonte.mx/foto/470000/475983_6.jpg"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //Execute finalization block
            UIImage *image = [UIImage imageWithData:imageData];
            completionBlock(image);
        });
    });
}

- (IBAction)downloadImage:(id)sender {
    [self imageWith:^(UIImage *image) {
        self.photoView.image = image;
    }];
}
@end
