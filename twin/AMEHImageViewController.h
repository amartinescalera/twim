//
//  AMEHImageViewController.h
//  twin
//
//  Created by Antonio Martin on 19/01/2015.
//  Copyright (c) 2015 antoniomeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMEHImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
- (IBAction)downloadImage:(id)sender;

-(void) imageWith:(void (^) (UIImage *image)) completionBlock;

@end
