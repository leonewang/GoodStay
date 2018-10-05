/**
 * Created by pan on 17/1/12 0012.
 *  七牛上传图片JS
 *  传入token后执行方法
 */

function uploaderReady(token){
    var image_num = 1;
    var total_num = 0;
    var uploader = Qiniu.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: 'pickfiles',     //上传按钮的ID
        container: 'container',      //上传按钮的上级元素ID
        drop_element: 'container',
        max_file_size: '100mb',         //最大文件限制
        flash_swf_url: '/static/js/plupload/Moxie.swf',
        dragdrop: true,
        chunk_size: '4mb',              //分块大小
        // uptoken_url: '/UptokenServlet',              //Ajax请求upToken的Url，**强烈建议设置**（服务端提供）
        uptoken: token,                 //若未指定uptoken_url,则必须指定 uptoken ,uptoken由其他程序生成
        // save_key: true,              // 默认 false。若在服务端生成uptoken的上传策略中指定了 `sava_key`，则开启，SDK在前端将不对key进行任何处理
        domain: 'http://pg36wkomn.bkt.clouddn.com/',    //自己的七牛云存储空间域名
        multi_selection: true,         //是否允许同时选择多文件
        filters: {
            mime_types: [               //文件类型过滤，这里限制为图片类型
                {title: "Image files", extensions: "jpg,jpeg,gif,png"}
            ],
            max_file_size: "4mb",
            prevent_duplicates: true
        },
        auto_start: true,
        unique_names :true,             //自动生成文件名,如果值为false则保留原文件名上传
        init: {
            'FilesAdded': function (up, files) {
                plupload.each(files, function(file) {
                    // 文件添加进队列后，处理相关的事情
                    console.log(file.name);
                    total_num++;
                });
            },
            'BeforeUpload': function (up, file) {
                $('#image-num').text(image_num++ + " of ");
                $('#total-num').text(total_num + " uploading...");
                // 每个文件上传前，处理相关的事情
            },
            'UploadProgress': function (up, file) {
                //文件上传时，处理相关的事情

                /*可能是文件大小
                var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                */

                //上传进度
                $('#qiniupercent').attr('style','width:'+file.percent+'%');
                console.log(file.percent + "%");
            },
            'UploadComplete': function () {
                //do something
                $('#qiniupercent').attr('style','width:0%');
                $('#pickfiles').text("All Uploaded!");
                console.log("upload completed!");
            },
            'FileUploaded': function (up, file, info) {
                //每个文件上传成功后,处理相关的事情
                //其中 info 是文件上传成功后，服务端返回的json，形式如
                //{
                //  "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
                //  "key": "gogopher.jpg"
                //}
                var domain = up.getOption('domain');
                var res = eval('(' + info + ')');
                var sourceLink = domain + res.key;//获取上传文件的链接地址
                $.ajax({
                    url: "ImageServlet",
                    data: {
                        post_id: $("#post_id").attr('value'),
                        content: sourceLink
                    },
                    type: "GET",
                    datatype: "txt",
                    success: function(data){
                        console.log("Send to backend successfully!");
                    }
                });
                console.log(sourceLink);
            },
            'Error': function (up, err, errTip) {
                alert(errTip);
            },
            /**
             * @return {string}
             */
            'Key': function (up, file) {
                //当save_key和unique_names设为false时，该方法将被调用
                // var key = "";
                // $.ajax({
                //     url: '/qiniu-token/get-key/',
                //     type: 'GET',
                //     async: false,//这里应设置为同步的方式
                //     success: function (data) {
                //         var ext = Qiniu.getFileExtension(file.name);
                //         key = data + '.' + ext;
                //     },
                //     cache: false
                // });
                // return key;
            }
        }
    });
    uploader.start();
}