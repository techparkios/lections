//
//  ViewController.m
//  ynav_test
//
//  Created by d.taraev on 27.05.17.
//  Copyright © 2017 mail.ru. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)openInNavigatorAppTapped:(UIButton *)sender {
    
    NSURL *navURL = [NSURL URLWithString:@"yandexmaps://build_route_on_map?lat_from=55.751802&lon_from=37.586684&lat_to=55.758192&lon_to=37.642817"];
    
    if([[UIApplication sharedApplication] canOpenURL:navURL]) {
        
        NSLog(@"can open: %@", navURL);
        
        //for iOS older than iOS 10
        //[[UIApplication sharedApplication] openURL:navURL];
        
        //for iOS 10
        [[UIApplication sharedApplication] openURL:navURL options:@{} completionHandler:nil];
    } else {
        
        NSLog(@"cannot open: %@", navURL);
    }
}

- (IBAction)openGallery:(UIButton *)sender {
    
//    PHPhotoLibrary *library = [PHPhotoLibrary sharedPhotoLibrary];
    
//    PHImageRequestOptions *options = [PHImageRequestOptions ]
    
    
    PHImageManager *manager = [PHImageManager defaultManager];
    
    PHFetchResult *result = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:nil];
    
    [manager requestImageForAsset:result.firstObject targetSize:CGSizeMake(320.f, 320.f) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        
        NSLog(@"%@", result);
    }];
    
    
}

@end
