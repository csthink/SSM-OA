/**
 * 业务相关的JS
 */
'use strict';

// ****************************** 员工管理 ******************************** //

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 添加员工开始 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
// 获取员工添加表单
// TODO 待优化这样的if判断dom节点
var emp_add_form = document.getElementById("employee-add-form");
if (null != emp_add_form) {
    // 实例化验证器，添加验证规则
    var empVld = new Validator();
    empVld.add(emp_add_form.real_name, [{strategy: 'isNonEmpty', errorMsg: '姓名不能为空'}]);
    empVld.add(emp_add_form.birth_date, [{strategy: 'isNonEmpty', errorMsg: '出生日期不能为空'}]);
    empVld.add(emp_add_form.hire_date, [{strategy: 'isNonEmpty', errorMsg: '入职时间不能为空'}]);
    empVld.add(emp_add_form.phone_num,
        [
            {strategy: 'isNonEmpty', errorMsg: '手机号不能为空'},
            {strategy: 'isPhone', errorMsg: '手机号格式不正确'}
        ]
    );
    empVld.add(emp_add_form.captcha_input, [{strategy: 'isNonEmpty', errorMsg: '图形验证码不能为空'}]);
    empVld.add(emp_add_form.sms_code, [{strategy: 'isNonEmpty', errorMsg: '短信验证码不能为空'}]);

    var submitEmpAddForm;

    /**
     * 表单提交函数(被装饰者函数)
     */
    submitEmpAddForm = function () {
        var formData = new FormData(emp_add_form);

        swal({
            title: "确定保存信息",
            text: "",
            type: "info",
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
        }, function () {
            $.ajax({
                url: "/employee/add.do",
                type: "post",
                data: formData,
                dataType: "json",
                processData: false,
                contentType: false,
                success: function (data) {
                    console.log(data);
                    var flag = data.flag;
                    var msg = data.msg;
                    if (flag === true) { // 注册成功
                        swal(msg);
                        // Message.success(msg);
                        setTimeout(function () {
                            window.location.href = "/employee/list.do";
                        }, 2000);
                    } else { // 注册失败
                        swal(msg);
                    }
                },
                error: function (e) {
                    console.log(e);
                    Message.error(e);
                }
            });

        });
    };

    // 添加装饰者,表单提交之前执行校验
    submitEmpAddForm = submitEmpAddForm.before(empVld.start.bind(empVld));
    // 表单提交按钮点击事件，触发表单提交，发异步请求
    emp_add_form.submit.onclick = function () {
        submitEmpAddForm();
    };

    // 员工发送短信按钮验证规则
    var empSendSmsVld = new Validator();
    empSendSmsVld.add(emp_add_form.captcha, [{strategy: 'isNonEmpty', errorMsg: '图形验证码不能为空'}]);
    empSendSmsVld.add(emp_add_form.phone_num,
        [
            {strategy: 'isNonEmpty', errorMsg: '手机号不能为空'},
            {strategy: 'isPhone', errorMsg: '手机号格式不正确'}
        ]
    );

    var sendEmpSms;
    // 处理员工注册页的发送短信
    sendEmpSms = function () {
        var params = {
            "captcha": emp_add_form.captcha.value,
            "phone": emp_add_form.phone_num.value
        };

        $.post("/employee/sendSms.do", params, function (data) {
            if (data.flag === true) {
                Message.success(data.msg);
            } else {
                Message.error(data.msg);
            }
        }, "json");
    };
    // 添加装饰者，发送短信的前置操作
    sendEmpSms = sendEmpSms.before(empSendSmsVld.start.bind(empSendSmsVld));

    var emp_send_sms = document.getElementById("emp_send_sms");
    // 员工注册页面发送短信操作
    emp_send_sms.onclick = function () {
        console.log("sendSMS");
        sendEmpSms();
    };
}


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 编辑员工开始 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
// 获取员工编辑表单
var emp_edit_form = document.getElementById("employee-edit-form");

if (null != emp_edit_form) {
    // 实例化验证器，添加验证规则
    var empEditVld = new Validator();
    empEditVld.add(emp_edit_form.real_name, [{strategy: 'isNonEmpty', errorMsg: '姓名不能为空'}]);
    empEditVld.add(emp_edit_form.birth_date, [{strategy: 'isNonEmpty', errorMsg: '出生日期不能为空'}]);
    empEditVld.add(emp_edit_form.hire_date, [{strategy: 'isNonEmpty', errorMsg: '入职时间不能为空'}]);
    empEditVld.add(emp_edit_form.phone_num,
        [
            {strategy: 'isNonEmpty', errorMsg: '手机号不能为空'},
            {strategy: 'isPhone', errorMsg: '手机号格式不正确'}
        ]
    );

    var submitEmpEditForm;
    /**
     * 表单提交函数(被装饰者函数)
     */
    submitEmpEditForm = function () {
        var formData = new FormData(emp_edit_form);

        swal({
            title: "确定保存信息",
            text: "",
            type: "info",
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
        }, function () {
            $.ajax({
                url: "/employee/edit.do",
                type: "post",
                data: formData,
                dataType: "json",
                processData: false,
                contentType: false,
                success: function (data) {
                    console.log(data);
                    var flag = data.flag;
                    var msg = data.msg;
                    if (flag === true) { // 注册成功
                        swal(msg);
                        // Message.success(msg);
                        setTimeout(function () {
                            window.location.href = "/employee/list.do";
                        }, 2000);
                    } else { // 注册失败
                        swal(msg);
                    }
                },
                error: function (e) {
                    console.log(e);
                    Message.error(e);
                }
            });

        });


    };

    // 添加装饰者,表单提交之前执行校验
    submitEmpEditForm = submitEmpEditForm.before(empEditVld.start.bind(empEditVld));
    // 表单提交按钮点击事件，触发表单提交，发异步请求
    emp_edit_form.submit.onclick = function () {
        submitEmpEditForm();
    };
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 员工列表开始 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
// 员工列表删除员工操作
$(".empRemove").click(function () {
    var emp_id = $(this).attr("data-id");
    var currentRow = $(this).parents("tr");

    swal({
        title: "确定删除此员工?",
        text: "此操作将会永久删除该员工",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#dc3545",
        confirmButtonText: "确定删除",
        cancelButtonText: "取消",
        closeOnConfirm: false,
        closeOnCancel: false
    }, function (isConfirm) {
        if (isConfirm) {
            $.ajax({
                url: "/employee/remove.do",
                type: "post",
                data: {id: emp_id},
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var flag = data.flag;
                    var msg = data.msg;
                    if (flag === true) { // 操作成功
                        swal("已删除!", "该员工已被删除.", "success");
                        currentRow.remove();
                    } else { // 操作失败
                        swal("删除失败", msg, "danger");
                    }
                },
                error: function (e) {
                    console.log(e);
                    Message.error(e);
                }
            });
        } else {
            swal("已取消删除", "当前员工信息依然完整:)", "error");
        }

    });
});

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 登录页面开始 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
let loginForm = document.getElementById("login-form");
if (null != loginForm) {
    // let form = loginForm;
    // 实例化验证器，添加验证规则
    let vld = new Validator();
    vld.add(loginForm.username, [{strategy: 'isNonEmpty', errorMsg: '用户名不能为空'}]);
    vld.add(loginForm.password, [{strategy: 'isNonEmpty', errorMsg: '密码不能为空'}]);

    var submitForm;

    /**
     * 表单提交函数(被装饰者函数)
     */
    submitForm = function () {
        // let formData = new FormData(loginForm);

        let formData = {
          username: loginForm.username.value,
          password: loginForm.password.value
        };
        swal({
            title: "确定登录信息",
            text: "",
            type: "info",
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
        }, function () {
            console.log("ajax ...");
            /*
            ajax({url: "/login/login.do", type:"POST", data:formData, success: function(data) {

                    console.log(data);
                    let result = JSON.parse(data);
                    let flag = result.flag;
                    let msg = result.msg;
                    console.log(flag);
                    console.log(msg);
                    if (flag === true) { // 登录成功
                        Message.success(msg);
                        setTimeout(function () {
                            window.location.href = "/employee/list.do";
                        }, 2000);
                    } else { // 登录失败
                        swal(msg);
                    }
                }});
            */


            $.ajax({
                url: "/login/login.do",
                type: "post",
                data: formData,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    let flag = data.flag;
                    let msg = data.msg;
                    if (flag === true) { // 登录成功
                        swal(msg);
                        // Message.success(msg);
                        setTimeout(function () {
                            window.location.href = "/employee/list.do";
                        }, 1000);
                    } else { // 登录失败
                        swal(msg);
                    }
                },
                error: function (e) {
                    console.log(e);
                    Message.error(e);
                }
            });

        });

    };

    // 添加装饰者,表单提交之前执行校验
    submitForm = submitForm.before(vld.start.bind(vld));
    // 表单提交按钮点击事件，触发表单提交，发异步请求
    loginForm.submit.onclick = function () {
        submitForm();
    };
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 登录忘记密码开始 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
let loginForgotPwdForm = document.getElementById("login-forgot-password-form");
if (null != loginForgotPwdForm) {
    let form = loginForgotPwdForm;

    let sendSms = document.getElementById("login_send_sms");
    // 实例化验证器，添加验证规则
    let sendVld = new Validator();
    sendVld.add(form.phone, [{strategy: 'isNonEmpty', errorMsg: '手机号不能为空'}, {strategy: 'isPhone', errorMsg: '手机号格式不正确'}]);
    let send;
    send = function () {
        $.ajax({
            url: "/login/sendSms.do",
            type: "post",
            data: {phone: form.phone.value, type: "forgotPassword"},
            dataType: "json",
            success: function (data) {
                console.log(data);
                let flag = data.flag;
                let msg = data.msg;
                if (flag === true) { // 发送成功
                    Message.success(msg);
                } else { // 发送失败
                   swal(msg);
                }
            },
            error: function (e) {
                console.log(e);
                Message.error(e);
            }
        });
    };
    // 添加装饰者,表单提交之前执行校验
    send = send.before(sendVld.start.bind(sendVld));
    // 提交按钮点击事件，触发表单提交，发异步请求
    sendSms.onclick = function () {
        send();
    };

    // 实例化验证器，添加验证规则
    let vld = new Validator();
    vld.add(form.phone, [{strategy: 'isNonEmpty', errorMsg: '手机号不能为空'}, {strategy: 'isPhone', errorMsg: '手机号格式不正确'}]);
    vld.add(form.smsCode, [{strategy: 'isNonEmpty', errorMsg: '短信验证码不能为空'}]);
    vld.add(form.password, [{strategy: 'isNonEmpty', errorMsg: '密码不能为空'}]);

    let submitForm;

    /**
     * 表单提交函数(被装饰者函数)
     */
    submitForm = function () {
        // let formData = new FormData(form);

        let formData = {
            phone: form.phone.value,
            smsCode: form.smsCode.value,
            password: form.password.value
        };
        console.log(formData);
        $.ajax({
            url: "/login/changePassword.do",
            type: "post",
            data: formData,
            dataType: "json",
            success: function (data) {
                console.log(data);
                let flag = data.flag;
                let msg = data.msg;
                if (flag === true) { // 修改成功
                    swal(msg);
                    // Message.success(msg);
                    setTimeout(function () {
                        window.location.href = "/login/toLogin.do";
                    }, 1000);
                } else { // 登录失败
                    swal(msg);
                }
            },
            error: function (e) {
                console.log(e);
                Message.error(e);
            }
        });
    };

    // 添加装饰者,表单提交之前执行校验
    submitForm = submitForm.before(vld.start.bind(vld));
    // 表单提交按钮点击事件，触发表单提交，发异步请求
    form.submit.onclick = function () {
        submitForm();
    };
}


var ajax = function (options, callback) {
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
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        } else {

        }
        // xhr.setRequestHeader("Content-Type", "multipart/form-data");
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