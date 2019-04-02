/**
 * 自定义工具JS
 */
'use strict';

var Message = function() {};

Message.run = function ($obj, text) {
    $obj.show().siblings().hide();
    $obj.find(".msg_text").html(text);
    $obj.delay(5000).slideUp(300);
};

Message.info = function (text) {
    Message.run($(".info_msg"), text);
};

Message.success = function (text) {
    Message.run($(".success_msg"), text);
};

Message.warn = function (text) {
    Message.run($(".warn_msg"), text);
};

Message.error = function (text) {
    Message.run($(".error_msg"), text);
};


/**
 * 扩展AOP前置操作 >>> beforeFn函数返回false则不执行当前函数
 *
 * @param beforeFn 扩展函数,装饰函数
 * @returns {function(): *}
 */
Function.prototype.before = function (beforeFn) {
    var self = this;
    return function () {
        if (beforeFn.apply(this, arguments) === false) {
            return;
        }

        return self.apply(this, arguments);
    }
};


/**
 * 定义策略对象『验证规则』
 *
 * @type {{isNumber: strategies.isNumber, isPhone: strategies.isPhone, isEmail: strategies.isEmail, minSize: strategies.minSize, maxSize: strategies.maxSize, isNonEmpty: strategies.isNonEmpty}}
 */
var strategies = {
    // 不能为空
    isNonEmpty: function (value, errorMsg) {
        if (value === "") {
            return errorMsg;
        }
    },
    // 最小长度
    minSize: function (value, length, errorMsg) {
        if (value.length < length) {
            return errorMsg;
        }
    },
    // 最大长度
    maxSize: function (value, length, errorMsg) {
        if (value.length > length) {
            return errorMsg;
        }
    },
    // 是否是手机号
    isPhone: function (value, errorMsg) {
        var reg = /^1[34578]\d{9}$/;
        if (!reg.test(value)) {
            return errorMsg;
        }
    },
    // 是否是邮箱
    isEmail: function (value, errorMsg) {
        var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if (value == null || value === "" || !reg.test(value)) {
            return errorMsg;
        }
    },
    // 是否是数字
    isNumber: function (value, errorMsg) {
        var reg = /^\d+$/;
        if (value == null || value === "" || !reg.test(value)) {
            return errorMsg;
        }
    }
};

/**
 * Validator 类的实现，使用 prototype 扩展类的动态方法(需实例化后调用)
 *
 * @constructor
 */
var Validator = function () {
    this.rules = []; // 用于存放负责验证的函数
};

/**
 * 添加验证规则
 *
 * @param domNode
 * @param ruleArr
 * @returns {Validator}
 */
Validator.prototype.add = function (domNode, ruleArr) {
    var self = this;
    for (var i = 0, rule; rule = ruleArr[i++];) {
        (function (rule) {
            var strategyArr = rule.strategy.split(':'),
                errorMsg = rule.errorMsg;
            self.rules.push(function () {
                var tempArr = strategyArr.concat();
                var ruleName = tempArr.shift();
                tempArr.unshift(domNode.value);
                tempArr.push(errorMsg);
                return strategies[ruleName].apply(domNode, tempArr);
            });
        })(rule);
    }
    return this;
};

/**
 * 表单验证函数(装饰函数)
 * @returns {*}
 */
Validator.prototype.start = function () {
    for (var i = 0, fun; fun = this.rules[i++];) {
        var errorMsg = fun();
        if (errorMsg) {
           //Message.warn(errorMsg);
            swal({
                title: errorMsg,
                timer: 1200,
                showConfirmButton: false
            });
            return false;
        }
    }
};