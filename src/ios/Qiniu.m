//
//  Qiniu.m
//  好知音
//
//  Created by zoe on 16/1/22.
//
//

#import "Qiniu.h"

@interface Qiniu ()

@end

@implementation Qiniu

- (void)uploadFile:(CDVInvokedUrlCommand *)command
{



    NSDictionary* options = [command.arguments objectAtIndex:0];
    self.callbackId = command.callbackId;
    NSLog(@"token:%@",self.callbackId);

    //_filePath = [options objectForKey:@"filePath"];

    
    
    //NSLog(@"filePath:%@",_filePath);

    
    _filePaths = [options objectForKey:@"filePath"];
    
    
    
    NSString* uptoken = [options objectForKey:@"uptoken"];
    NSString* fileprefix = [options objectForKey:@"prefix"];

    if(uptoken&&uptoken.length>1)
    {
        self.token = uptoken;
    }
    else
    {
        self.token = @"h2mORFn4Zdd9XO6Nr2yhfz9fi7NtasV4N7aWeKAP:VFU4yVeegOsKaY54qMtgHuw34lk=:eyJyZXR1cm5Cb2R5Ijoie1widXJsXCI6XCJodHRwOi8vN3hsbXBoLmNvbTEuejAuZ2xiLmNsb3VkZG4uY29tLyQoa2V5KVwiLFwia2V5XCI6ICQoa2V5KSwgXCJoYXNoXCI6ICQoZXRhZyksIFwid1wiOiAkKGltYWdlSW5mby53aWR0aCksIFwiaFwiOiAkKGltYWdlSW5mby5oZWlnaHQpfSIsInNjb3BlIjoiaGFvemhpeWluIiwiZGVhZGxpbmUiOjE0NTQyMjUyMzF9";
    }
    NSLog(@"token:%@",self.token);

    self.sUploader = [QiniuSimpleUploader uploaderWithToken:self.token];
    self.sUploader.delegate = self;

    self.rUploader = [[QiniuResumableUploader alloc] initWithToken:self.token];
    self.rUploader.delegate = self;
    _filecounter=0;
    _filetotal=_filePaths.count;
    _returns = [[NSMutableArray alloc] init];
    for (id obj in _filePaths) {
        //string = [string1 stringByAppendingString:string2];
        NSString* keyfilename;

        NSString *filename = [obj lastPathComponent]; 
        NSLog(@"filename:%@",filename);
        if(fileprefix != NULL)
        {
            keyfilename = [fileprefix stringByAppendingString:filename];
        }
        else
        {
            keyfilename = filename;
        }
        NSLog(@"filename22:%@",keyfilename);
        [self.sUploader uploadFile:obj key:keyfilename extra:nil];
    }
    
    
    //[self.sUploader uploadFile:_filePath key:nil extra:nil];

    /*
     if (echo != nil && [echo length] > 0) {
     //返回成功，messageAsString将数据返回到JavaScript。
     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
     } else {
     //返回失败。
     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
     }
     //将结果发送给<code>self.commandDelegate</code>，这样会执行JavaScript side的成功或失败方法。
     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
     */

}
- (void)uploadSucceeded:(NSString *)theFilePath ret:(NSDictionary *)ret
{
    _filecounter++;
    //NSString *k = [[NSString alloc] initWithFormat:@"%d",_filecounter];
    //[_returns setValue:ret forKey:k];
    [_returns addObject:ret];
    NSString *succeedMsg = [NSString stringWithFormat:@"Upload Succeeded: - Ret: %@\n", ret];
    NSLog(@"token:%@",self.callbackId);
    NSLog(@"uploadSucceeded:%@",succeedMsg);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:_returns];
    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:ret];
    if (_filetotal==_filecounter) {
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    }
    //[self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];

}

// Upload failed
- (void)uploadFailed:(NSString *)theFilePath error:(NSError *)error
{
    NSString *failMsg = [NSString stringWithFormat:@"Upload Failed: %@  - Reason: %@", theFilePath, error];
    NSLog(@"token:%@",self.callbackId);
    NSLog(@"uploadSucceeded:%@",failMsg);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:failMsg];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
}
- (NSString *) timeString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy-MM-dd-HH-mm-ss-zzz"];
    return [formatter stringFromDate:[NSDate date]];
}
/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
