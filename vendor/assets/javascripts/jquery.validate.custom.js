/**
 * Created by pan on 14-7-16.
 */
$.validator.setDefaults({
  highlight: function (element){

    $(element).addClass('validate-input-error');
  },
  unhighlight: function (element){
    $(element).removeClass('validate-input-error');
  },
  errorPlacement: function (error, element){
    var $e = $(element);
    var inputGroup = $e.closest('.input-group');
    if(!inputGroup.length) {
      error.insertAfter($e);
    }
    else {
      error.insertAfter(inputGroup);
    }
  }
});

jQuery.extend(jQuery.validator.messages, {
  required: "必选字段",
  remote: "请修正该字段",
  email: "请输入正确格式的邮箱",
  url: "请输入正确的网址",
  date: "请输入合法的日期",
  dateISO: "请输入合法的日期 (ISO).",
  number: "请输入合法的数字",
  digits: "只能输入整数",
  creditcard: "请输入合法的信用卡号",
  equalTo: "请再次输入相同的值",
  accept: "请输入拥有合法后缀名的字符串",
  maxlength: jQuery.validator.format("请输入一个 长度最多是 {0} 的字符串"),
  minlength: jQuery.validator.format("请输入一个 长度最少是 {0} 的字符串"),
  rangelength: jQuery.validator.format("请输入 一个长度介于 {0} 和 {1} 之间的字符串"),
  range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
  max: jQuery.validator.format("请输入一个最大为{0} 的值"),
  min: jQuery.validator.format("请输入一个最小为{0} 的值"),
  require_from_group: jQuery.validator.format("请至少输入这些字段的{0}其中一项")
});


// why not use date_min, because normalizeAttributeRule, Convert the value to a number for number inputs
// broken value fetch
jQuery.validator.addMethod("date_Min", function (value, element, param){

  return this.optional(element) || moment(value) >= moment(param);
}, jQuery.validator.messages.min);

jQuery.validator.addMethod("date_Max", function (value, element, param){
  return this.optional(element) || moment(value) <= moment(param);
}, jQuery.validator.messages.max);

/* 手机号码验证*/
jQuery.validator.addMethod("mobile", function (value, element){
  //  var length = value.length;
  // return this.optional(element)||(/^(([0\+]\d{1,5})?(\D)?1[3|4|5|7|8][0-9]\d{4,8})?$/.test(value));
  var mobile_regex = /^[/\*\+\.\-\,\;\(\)\s\d]+$/;

  return this.optional(element)||(mobile_regex.test(value));
}, "请输入正确的手机号码");

jQuery.validator.addMethod("regular_mobile", function (value, element){
  //  var length = value.length;
  // return this.optional(element)||(/^(([0\+]\d{1,5})?(\D)?1[3|4|5|7|8][0-9]\d{4,8})?$/.test(value));
  var mobile_regex = /^1\d{10,10}$/;

  return this.optional(element)||(mobile_regex.test(value));
}, "请输入正确的手机号码");

jQuery.validator.addMethod("tel", function (value, element){
// var length = value.length;
// var mobile =/^(([0\+]\d{1,5})?(\D)?1[3|4|5|7|8][0-9]\d{4,8})?$/;
// 国家代码最多5位    区号最多5位，分机号最多4位
// var tel = /^(([0\+]\d{1,5})?(\D)?(0\d{2,5}))(\D)?(\d{7,8})(\D(\d{0,4}))?$/;
// 非中文字符
// var tel=/^.*?[\u4E00-\u9FFF]+.*$/

// return this.optional(element)||!tel.test(value)||(mobile.test(value));

  var mobile_regex = /^[/\*\+\.\-\,\;\(\)\s\d]+$/;

  return this.optional(element)||(mobile_regex.test(value));
}, "请输入正确的电话号码");


/*当前元素值是否小于目标元素值*/
$.validator.addMethod('gt', function (value, element, param) {
  var $target = $(param);
  if (this.settings.onfocusout) {
    $target.unbind(".validate-lt").bind("blur.validate-lt", function () {
      $(element).valid();
    });
  }

  if (value.length > 0) {
    return value >= $target.val();
  } else {
    return true
  }
});

/* remote validate */
jQuery.validator.addMethod("phone_exists", function (value, element, params){
  var value = value.trim();
  if(value != "") {
    var result = false;
    var current_user_id = $(element).parents("form").eq(0).find("input[name='user[id]']").val();
    data = {user: {phone: value}};
    if(current_user_id != null&& !_.isEmpty(current_user_id)) {
      data = $.extend(data, {exclude: {id: current_user_id}})
    }
    $.ajax({
      url: "/api/users/exists.json",
      type: "post",
      async: false,
      beforeSend: function (xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: data,
      success: function (data, status){
        if(data.code == '0') {
          result = true
        } else {
          jQuery.validator.messages["phone_exists"] = data.remark
        }
      }
    });

    return result;
  } else {
    var required = $(element).attr('required')
    return !required;
  }
}, "手机号已经被注册，请换一个手机号");

var customer_dupliate_attrs = [
  {

    name: "customer_name_exists",
    field_name: "name",
    message: "你已经有相同客户名称的客户"
  },
  {
    name: "customer_name_theirs_exists",
    field_name: "customer_name",
    message: "公司内相同客户名称的客户"
  },
  {
    name: "customer_company_name_exists",
    field_name: "company_name",
    message: "你已经有相同公司名称的客户"
  },
  {
    name: "customer_tel_exists",
    field_name: "tel",
    message: "你已经有相同电话的客户"
  },
  {
    name: "customer_phone_exists",
    field_name: "phone",
    message: "你已经有相同手机号码的客户"
  },
  {
    name: "customer_qq_exists",
    field_name: "qq",
    message: "你已经有相同QQ的客户"
  },
  {
    name: "customer_wechat_exists",
    field_name: "wechat",
    message: "你已经有相同微信的客户"
  },
  {
    name: "customer_wangwang_exists",
    field_name: "wangwang",
    message: "你已经有相同旺旺的客户"
  },
  {
    name: "customer_email_exists",
    field_name: "email",
    message: "你已经有相同邮箱的客户"
  },
  {
    name: "customer_url_exists",
    field_name: "url",
    message: "你已经有相同网址的客户"
  },
  {
    name: "customer_fax_exists",
    field_name: "fax",
    message: "你已经有相同传真的客户"
  }
]

$.each(customer_dupliate_attrs, function (customer_dupliate_attr) {
  /* remote validate */
  var _name = customer_dupliate_attr.name, field_name = customer_dupliate_attr.field_name, message = customer_dupliate_attr.message;

  jQuery.validator.messages[_name] = message
  jQuery.validator.addMethod(_name, function (value, element, params){
    var value = value.trim();
    if(value != "") {
      var result = false;
      var _id = $(element).parents("form").eq(0).find("input[name='customer[id]']").val();
      data = {field: field_name, field_value: value};
      if(!_.isEmpty(_id)) {
        data = $.extend(data, {customer_id: _id})
      }
      if ($(element).attr(_name) != "true") {
        return true;
      }

      $.ajax({
        url: "/api/customers/check_duplicate_field.json",
        type: "post",
        async: false,
        beforeSend: function (xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: data,
        success: function (data, status){
          if(data.code == '0') {
            result = true
          } else if (data.remark){
            jQuery.validator.messages[_name] = data.remark
          }
        }
      });

      return result;
    } else {
      var required = $(element).attr('required')
      return !required;
    }
  }, undefined);
});

/* remote validate */
jQuery.validator.messages["custom_field_label_exists"] = "你已经有相同的字段名称"
jQuery.validator.addMethod("custom_field_label_exists", function (value, element, params){
  var value = value.trim();
  if(value != "") {
    var result = false;
    var id = $(element).parents("form").eq(0).find("#custom_field_id").val();
    var setting_id = $(element).parents("form").eq(0).find("#custom_field_custom_field_setting_id").val();

    data = {id: id, field_value: value};

    $.ajax({
      url: "/custom_field_settings/" + setting_id + "/custom_fields/check_duplicate_field.json",
      type: "post",
      async: false,
      beforeSend: function (xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: data,
      success: function (data, status){
        if(data.code == '0') {
          result = true
        } else if (data.remark){
          jQuery.validator.messages["custom_field_label_exists"] = data.remark
        }
      }
    });

    return result;
  } else {
    var required = $(element).attr('required')
    return !required;
  }
}, undefined);

/* remote validate */
jQuery.validator.messages["custom_field_group_label_exists"] = "你已经有相同的区块名称"
jQuery.validator.addMethod("custom_field_group_label_exists", function (value, element, params){
  var value = value.trim();
  if(value != "") {
    var result = false;
    var id = $(element).parents("form").eq(0).find("#custom_field_group_id").val();
    var setting_id = $(element).parents("form").eq(0).find("#custom_field_custom_field_setting_id").val();

    data = {label: value, custom_field_setting_id: setting_id};

    if (! _.isEmpty(id)) {
      data['custom_field_group_id'] = id;
    }

    $.ajax({
      url: "/api/custom_field_groups/check_duplicate_field.json",
      type: "post",
      async: false,
      beforeSend: function (xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: data,
      success: function (data, status){
        if(data.code == '0') {
          result = true
        } else if (data.remark){
          jQuery.validator.messages["custom_field_group_label_exists"] = data.remark
        }
      }
    });

    return result;
  } else {
    var required = $(element).attr('required')
    return !required;
  }
}, undefined);

jQuery.validator.messages["custom_report_name_exists"] = "你已经有相同名称的自定义报表"
jQuery.validator.addMethod("custom_report_name_exists", function (value, element, params){
    var value = value.trim();
    if(value != "") {
        var result = false;
        var _id = $(element).parents("form").eq(0).find("input[name='custom_report[id]']").val();
        data = {field: "name", field_value: value};
        if(!_.isEmpty(_id)) {
            data = $.extend(data, {custom_report_id: _id})
        }
        $.ajax({
            url: "/api/custom_reports/check_duplicate_field.json",
            type: "post",
            async: false,
            beforeSend: function (xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: data,
            success: function (data, status){
                if(data.code == '0') {
                    result = true
                } else if (data.remark){
                    jQuery.validator.messages["custom_report_name_exists"] = data.remark
                }
            }
        });

        return result;
    } else {
        var required = $(element).attr('required')
        return !required;
    }
}, undefined);

jQuery.validator.addMethod("email_exists", function (value, element, params){
  var value = value.trim();
  if(value != "") {
    var result = false;

    var current_user_id = $(element).parents("form").eq(0).find("input[name='user[id]']").val()

    data = {user: {email: value}}
    if(current_user_id != null&& !_.isEmpty(current_user_id)) {
      data = $.extend(data, {exclude: {id: current_user_id}})
    }

    $.ajax({
      url: "/api/users/exists.json",
      type: "post",
      async: false,
      beforeSend: function (xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: data,
      success: function (data, status){
        if(data.code == '0') {
          result = true
        } else {
          jQuery.validator.messages["email_exists"] = data.remark
        }
      }
    });

    return result;

  } else {
    var required = $(element).attr('required')
    return !required;
  }
}, "邮箱已经被注册，请换一个邮箱");

/* remote validate */
jQuery.validator.addMethod("product_no_exists", function (value, element, params){
  var value = value.trim();
  if(value != "") {
    var result = false;
    var product_id = $(element).parents("form").eq(0).find("input[name='product[id]']").val();
    data = {product: {product_no: value}};
    if(product_id != null&& !_.isEmpty(product_id)) {
      data = $.extend(data, {exclude: {id: product_id}})
    }
    $.ajax({
      url: "/api/products/exists.json",
      type: "post",
      async: false,
      beforeSend: function (xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: data,
      success: function (data, status){
        if(data.code == '0') {
          result = true
        }
      }
    });

    return result;
  } else {
    var required = $(element).attr('required')
    return !required;
  }
}, "产品编号已经使用过！");

jQuery.validator.addMethod("regular_char", function (value, element){
  var regular_regex = /^[\da-zA-Z\u4e00-\u9fa5][\da-zA-Z0-9\u4e00-\u9fa5]*$/;

  return this.optional(element) || (value.match(regular_regex));
}, "仅支持中文、英文、数字");
