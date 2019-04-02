$(function() {
    $('.dropify').dropify();

    var drEvent = $('#photo_dropify_event').dropify();
    drEvent.on('dropify.beforeClear', function(event, element) {
        return confirm("确定要删除 \"" + element.file.name + "\" ?");
    });

    drEvent.on('dropify.afterClear', function(event, element) {
        alert('文件已删除，记得保存!!!');
    });

    $('.dropify-fr').dropify({
        messages: {
            default: '头像',
            replace: '请上传一张员工的照片',
            remove: '删除',
            error: '出错了'
        }
    });
});