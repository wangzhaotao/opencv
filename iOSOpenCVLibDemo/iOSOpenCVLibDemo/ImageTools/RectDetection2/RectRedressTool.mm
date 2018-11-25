//
//  RectRedressTool.m
//  iOSOpenCVLibDemo
//
//  Created by wztMac on 2018/11/25.
//  Copyright © 2018年 wztMac. All rights reserved.
//

#import <opencv2/stitching/detail/blenders.hpp>
#import <opencv2/stitching/detail/exposure_compensate.hpp>

#import "RectRedressTool.h"
#import <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#import <opencv2/imgcodecs/ios.h>
#import <opencv2/imgproc/types_c.h>
#import <opencv2/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>//图像处理
#include <iostream>

using namespace cv;
using namespace std;


@implementation RectRedressTool


/*
 基于轮廓提取的矫正算法: 通过轮廓来获取旋转角度
 1.图片灰度化
 2.阈值二值化
 3.检测轮廓
 4.寻找轮廓的包围矩阵，并且获取角度
 5.根据角度进行旋转矫正
 6.对旋转后的图像进行轮廓提取
 7.对轮廓内的图像区域抠出来，成为一张独立图像
 */
-(void)rectDetectBaseOutline:(UIImage*)image completion:(void(^)(UIImage *binImage, UIImage *rotateImage, UIImage *resultImage))completion {
    
//    //原始图片
//    Mat srcImg = UIImageToMat(image);
//    //灰度图 二值图片
//    Mat gray, binImg;
//    //灰度化
//    cvtColor(srcImg, gray, COLOR_RGB2GRAY);
//    //二值化
//    threshold(gray, binImg, 100, 200, CV_THRESH_BINARY);
//    
//    vector<vector<cv::Point> > contours;
//    vector<cv::Rect> boundRect(contours.size());
//    //注意第5个参数为CV_RETR_EXTERNAL，只检索外框
//    findContours(binImg, contours, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_NONE); //找轮廓
//    cout << contours.size() << endl;
//    for (int i = 0; i < contours.size(); i++)
//    {
//        //需要获取的坐标
//        CvPoint2D32f rectpoint[4];
//        CvBox2D rect =minAreaRect(Mat(contours[i]));
//        
//        cvBoxPoints(rect, rectpoint); //获取4个顶点坐标
//        //与水平线的角度
//        float angle = rect.angle;
//        cout << angle << endl;
//        
//        int line1 = sqrt((rectpoint[1].y - rectpoint[0].y)*(rectpoint[1].y - rectpoint[0].y) + (rectpoint[1].x - rectpoint[0].x)*(rectpoint[1].x - rectpoint[0].x));
//        int line2 = sqrt((rectpoint[3].y - rectpoint[0].y)*(rectpoint[3].y - rectpoint[0].y) + (rectpoint[3].x - rectpoint[0].x)*(rectpoint[3].x - rectpoint[0].x));
//        //rectangle(binImg, rectpoint[0], rectpoint[3], Scalar(255), 2);
//        //面积太小的直接pass
//        if (line1 * line2 < 600)
//        {
//            continue;
//        }
//        
//        //为了让正方形横着放，所以旋转角度是不一样的。竖放的，给他加90度，翻过来
//        if (line1 > line2)
//        {
//            angle = 90 + angle;
//        }
//        
//        //新建一个感兴趣的区域图，大小跟原图一样大
//        Mat RoiSrcImg(srcImg.rows, srcImg.cols, CV_8UC3); //注意这里必须选CV_8UC3
//        RoiSrcImg.setTo(0); //颜色都设置为黑色
//        //imshow("新建的ROI", RoiSrcImg);
//        //对得到的轮廓填充一下
//        drawContours(binImg, contours, -1, Scalar(255),CV_FILLED);
//        
//        //抠图到RoiSrcImg
//        srcImg.copyTo(RoiSrcImg, binImg);
//        
//        
//        //再显示一下看看，除了感兴趣的区域，其他部分都是黑色的了
//        namedWindow("RoiSrcImg", 1);
//        imshow("RoiSrcImg", RoiSrcImg);
//        
//        //创建一个旋转后的图像
//        Mat RatationedImg(RoiSrcImg.rows, RoiSrcImg.cols, CV_8UC1);
//        RatationedImg.setTo(0);
//        //对RoiSrcImg进行旋转
//        Point2f center = rect.center;  //中心点
//        Mat M2 = getRotationMatrix2D(center, angle, 1);//计算旋转加缩放的变换矩阵
//        warpAffine(RoiSrcImg, RatationedImg, M2, RoiSrcImg.size(),1, 0, Scalar(0));//仿射变换
//        imshow("旋转之后", RatationedImg);
//        imwrite("r.jpg", RatationedImg); //将矫正后的图片保存下来
//    }
//    
//#if 1
//    //对ROI区域进行抠图
//    
//    //对旋转后的图片进行轮廓提取
//    vector<vector<cv::Point> > contours2;
//    Mat raw = imread("r.jpg");
//    Mat SecondFindImg;
//    //SecondFindImg.setTo(0);
//    cvtColor(raw, SecondFindImg, COLOR_BGR2GRAY);  //灰度化
//    threshold(SecondFindImg, SecondFindImg, 80, 200, CV_THRESH_BINARY);
//    findContours(SecondFindImg, contours2, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_NONE);
//    //cout << "sec contour:" << contours2.size() << endl;
//    
//    for (int j = 0; j < contours2.size(); j++)
//    {
//        //这时候其实就是一个长方形了，所以获取rect
//        cv::Rect rect = boundingRect(Mat(contours2[j]));
//        //面积太小的轮廓直接pass,通过设置过滤面积大小，可以保证只拿到外框
//        if (rect.area() < 600)
//        {
//            continue;
//        }
//        Mat dstImg = raw(rect);
//    }
//#endif

}

-(void)rectDetectBaseHoughLines:(UIImage*)image completion:(void(^)(UIImage *midImage, UIImage *resultImage))completion {
    
    
}

@end
