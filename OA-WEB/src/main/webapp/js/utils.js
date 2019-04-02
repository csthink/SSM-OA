
var ajax = function (options) {
    // 传入方式默认为对象
    options = options || {};
    // 默认为GET请求
    options.type = (options.type || "GET").toUpperCase();
    // 返回值类型默认为json
    options.dataType = options.dataType || 'json';
    // 默认为异步请求
    options.async = options.async || true;
    // 默认设置Content-Type
    options.contentType = options.contentType || true;
    // 默认处理数据
    options.processData = options.processData || true;

    var xhr;
    // 创建一个 ajax请求 「W3C标准和IE标准」
    if (window.XMLHttpRequest) { // W3C标准
        xhr = new XMLHttpRequest();
    } else { // IE标准
        xhr = new ActiveXObject('Microsoft.XMLHttpRequest')
    }

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var status = xhr.status;
            if (status >= 200 && status < 300) {
                options.success && options.success(xhr.responseText, xhr.responseXML);
            } else {
                options.fail && options.fail(status);
            }
        }
    };

    var params;
    if (options.type === 'GET') {
        // 对需要传入的参数的处理
        params = getParams(options.data);
        xhr.open("GET", options.url + '?' + params, options.async);
        xhr.send(null)
    } else if (options.type === 'POST') {
        // 打开请求
        xhr.open('POST', options.url, options.async);

        if (options.contentType === true) {
            // POST请求设置请求头
            // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        }
        xhr.setRequestHeader("Content-Type", "multipart/form-data");
        // 自定义请求头
        //xhr.setRequestHeader("Source", "API");
        //xhr.setRequestHeader("Authentication", "72b32a1f754ba1c09b3695e0cb6cde7f");

        params = options.processData === true ? getParams(options.data) : options.data;
        // xhr.onload = function () {
        //     console.log("上传完成!");
        // };

        // 发送请求参数
        xhr.send(params);
    }
};

/**
 * 对象参数的处理
 *
 * @param data
 * @returns {string}
 */
var getParams = function (data) {
    var arr = [];
    for (var param in data) {
        arr.push(encodeURIComponent(param) + '=' + encodeURIComponent(data[param]));
    }

    console.log(arr);
    arr.push(('randomNumber=' + Math.random()).replace('.'));
    console.log(arr);

    return arr.join('&');
};

var AjaxUtils = function () {
};

/**
 * jQuery的ajax普通封装
 *
 * @param uri
 * @param data
 * @param callback
 */
AjaxUtils.ajaxFn = function (uri, data, callback) {
    $.ajax({
        url: uri,
        type: 'POST',
        dataType: 'json',
        data: data
    })
        .done(callback)
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
};

/**
 * 原生ajax封装，设置header，传json
 *
 * @param uri
 * @param data
 * @param callback
 */
AjaxUtils.ajaxHdFn = function (uri, data, callback) {
    var getXmlHttpRequest = function () {
        if (window.XMLHttpRequest) {
            // 主流浏览器提供了XMLHttpRequest对象
            return new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            // 低版本的IE浏览器没有提供XMLHttpRequest对象
            // 所以必须使用IE浏览器的特定实现ActiveXObject
            return new ActiveXObject("Microsoft.XMLHttpRequest");
        }

    };
    var xhr = getXmlHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 获取成功后执行操作
            // 数据在xhr.responseText
            var resJson = JSON.parse(xhr.responseText);
            callback(resJson);
        }
    };
    xhr.open("post", uri, true);
    xhr.setRequestHeader("DeviceCode", "56");
    xhr.setRequestHeader("Source", "API");
    xhr.setRequestHeader("Authentication", "72b32a1f754ba1c09b3695e0cb6cde7f");

    xhr.setRequestHeader("Content-Type", "application/json");
    var dataStr = JSON.stringify(data);
    xhr.send(dataStr);
};

/**
 * 原生ajax封装，设置header，传json
 * @param uri
 * @param data
 * @param callback
 */
AjaxUtils.ajaxStrFn = function (uri, data, callback) {
    var getXmlHttpRequest = function () {
        if (window.XMLHttpRequest) {
            // 主流浏览器提供了XMLHttpRequest对象
            return new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            // 低版本的IE浏览器没有提供XMLHttpRequest对象
            // 所以必须使用IE浏览器的特定实现ActiveXObject
            return new ActiveXObject("Microsoft.XMLHttpRequest");
        }

    };
    var xhr = getXmlHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 获取成功后执行操作
            // 数据在xhr.responseText
            var resJson = JSON.parse(xhr.responseText);
            callback(resJson);
        }
    };
    xhr.open("post", uri, true);
    xhr.setRequestHeader("DeviceCode", "56");
    xhr.setRequestHeader("Source", "API");
    xhr.setRequestHeader("Authentication", "72b32a1f754ba1c09b3695e0cb6cde7f");

    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    var dataStr = '';
    for (var i in data) {
        if (dataStr) {
            dataStr += '&';
        }
        dataStr += i + '=' + data[i];
    }

    xhr.send(dataStr);
};

/**
 * 原生ajax封装，设置header，传上传excel文件，提交表单
 *
 * @param uri
 * @param formObj
 * @param callback
 */
AjaxUtils.ajaxFormFn = function (uri, formObj, callback) {
    var getXmlHttpRequest = function () {
        if (window.XMLHttpRequest) {
            //主流浏览器提供了XMLHttpRequest对象
            return new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            //低版本的IE浏览器没有提供XMLHttpRequest对象
            //所以必须使用IE浏览器的特定实现ActiveXObject
            return new ActiveXObject("Microsoft.XMLHttpRequest");
        }

    };
    var xhr = getXmlHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 获取成功后执行操作
            // 数据在xhr.responseText
            var resJson = JSON.parse(xhr.responseText);
            callback(resJson);
        }
    };

    xhr.open("post", uri, true);
    xhr.setRequestHeader("DeviceCode", "56");
    xhr.setRequestHeader("Source", "API");
    xhr.setRequestHeader("Authentication", "72b32a1f754ba1c09b3695e0cb6cde7f");

    xhr.onload = function () {
        console.log("上传完成!");
    };

    xhr.send(formObj);
};