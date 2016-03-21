# 更新QiniuUpload
update from https://github.com/wonderchief/qiniuCordova

而且与cordova-plugin-audio-recorder-api 

https://github.com/emj365/cordova-plugin-audio-recorder-api

组合使用。录音m4a文件，并上传到七牛云
修改了android代码和ios代码。
# 解决
1/ 支持prefix

2/ 更新qiniu的key（这个key文件为在七牛云服务器上的名字）
使用cordova-plugin-audio-recorder-api录制了m4a文件后，得到了全路径文件名。
此次更新，则是将key文件名，为去掉路径前缀的，仅仅留下文件名。

如：

iOS: /var/mobile/Applications/[UUID]/Library/NoCloud/[file-id].m4a 

Android: /data/data/[app-id]/files/[file-id].m4a
而key截取的是file-id.m4

这样在七牛上则看到的文件为：iOS: [prefix][file-id].m4 , android: [prefix]/[file-id].m4
方便管理员管理文件。

# 使用ionic中(传文件)
 
     $scope.qiniuUploadFile = function (filepath){
     var envapi="API PATH";//（通过服务器API来传递文件到qiniu，所以需要从API服务器获取文件传输token）
     var datareq = $resource(envapi+'/qiniufiles/getuptoken', {}, {
          query//
            method:'GET'
          }
        });
        datareq.query({}, {}, function(r){
          console.log(r);
          var options = {};//这段很关键。主要是传递给qiniu plugin的参数格式。
        options.filePath=[];
        options.filePath.push(filepath);
        options.uptoken=r.qiniuuptoken;
        options.prefix='noneofbug-';//可选参数

          window.plugins.QiniuUpload.upload(options,function(re){ // plugin 调用
            console.log(re); 
          },function(re){ 
            console.log(re);
          }); 
          
        },function(e){
          console.log(e);
        });
    }

# 录音并调用七牛
    $scope.recorderstop = function() {
      window.plugins.audioRecorderAPI.stop(function(msg) {
        // success
        alert('ok: ' + msg);
      }, function(msg) {
        // failed
        alert('ko: ' + msg);
      });
    }

    $scope.recorderrecord = function() {//此处只调用来录制。通过录制超时结束后，自动上传。也可以使用stop record函数去手动终止录制，并上传
      window.plugins.audioRecorderAPI.record(function(msg) {
        // complete
        alert('ok: ' + msg);
        console.log('ok: ' + msg);
    
        $scope.qiniuUploadFile(msg);//调用七牛上传文件
      }, function(msg) {
        // failed
        alert('ko: ' + msg);
      }, 30); // record 30 seconds
    }


＃联系方式:
    pail@techcopemate.net
