//
//  Qiniu.h
//  好知音
//
//  Created by zoe on 16/1/22.
//
//

#import <Cordova/CDV.h>
#import "QiniuSimpleUploader.h"
#import "QiniuResumableUploader.h"

@interface Qiniu : CDVPlugin<QiniuUploadDelegate>

@property (retain, nonatomic)QiniuRioPutExtra *extra;
@property (retain, nonatomic)QiniuResumableUploader *rUploader;
@property (retain, nonatomic)QiniuSimpleUploader *sUploader;
@property (copy, nonatomic)NSString *filePath;
@property (copy, nonatomic)NSArray *filePaths;
//@property (copy, nonatomic)NSMutableDictionary *returns;
@property (copy, nonatomic)NSMutableArray *returns;
@property (copy, nonatomic)NSString *lastResumableKey;
@property (copy, nonatomic)NSString *token;
@property (copy) NSString* callbackId;
@property (assign) int filecounter;
@property (assign) int filetotal;

- (void)uploadFile:(CDVInvokedUrlCommand*)command;

@end
