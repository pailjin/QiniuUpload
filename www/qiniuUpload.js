cordova.define("cordova/plugins/QiniuUpload", 
  function(require, exports, module) {
    var exec = require("cordova/exec");
    var QiniuUpload = function() {};
	QiniuUpload.prototype.upload = function(options,successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'upload', 'uploadFile',[options]);
    };
    QiniuUpload.prototype.uploads = function(options,successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'upload', 'uploadArrayFile',[options]);
    };

    var QiniuUpload = new QiniuUpload();
    module.exports = QiniuUpload;

});

  
if(!window.plugins) {
    window.plugins = {};
}
if (!window.plugins.QiniuUpload) {
    window.plugins.QiniuUpload = cordova.require("cordova/plugins/QiniuUpload");
}

