//
//  WTGaussFilterVC.m
//  OpenCVFaceDetectDemo
//
//  Created by ocean on 2018/11/23.
//  Copyright © 2018年 ocean. All rights reserved.
//

#import "WTGaussFilterVC.h"
#import "GaussFilterTool.h"

@interface WTGaussFilterVC ()
@property (nonatomic, strong) UIImage *originImage;
@property (weak, nonatomic) IBOutlet UIImageView *originImgView;
@property (weak, nonatomic) IBOutlet UIImageView *saltImgView;
@property (weak, nonatomic) IBOutlet UIImageView *cusGaussFilteImgView;
@property (weak, nonatomic) IBOutlet UIImageView *sysGaussFilteImgView;

- (IBAction)filteBtnAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *lastLabel;
- (IBAction)bilaterFilteBtnAction:(UIButton *)sender;


@end

@implementation WTGaussFilterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    _originImage = [UIImage imageNamed:@"face6.jpg"]; //face1.png
    
    _originImgView.image = _originImage;
    _saltImgView.image = _originImage;
    _cusGaussFilteImgView.image = _originImage;
    _sysGaussFilteImgView.image = _originImage;
}


- (IBAction)filteBtnAction:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    [[GaussFilterTool new] gaussFilteImage:_originImage completion:^(UIImage *saltNoiseImg, UIImage *cusGaussFilteImg, UIImage *sysGaussFilteImg) {
        
        weakSelf.saltImgView.image = saltNoiseImg;
        weakSelf.cusGaussFilteImgView.image = cusGaussFilteImg;
        weakSelf.sysGaussFilteImgView.image = sysGaussFilteImg;
        weakSelf.lastLabel.text = @"opencv高斯滤波";
    }];
}

- (IBAction)bilaterFilteBtnAction:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    [[GaussFilterTool new] bilateralFilteImage:_originImage completion:^(UIImage *saltNoiseImg, UIImage *filteImg) {
        
        weakSelf.saltImgView.image = saltNoiseImg;
        weakSelf.sysGaussFilteImgView.image = filteImg;
        weakSelf.lastLabel.text = @"双边滤波";
    }];
}



@end
