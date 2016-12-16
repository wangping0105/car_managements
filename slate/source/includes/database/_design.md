# 短信验证码 SmsCode
user_id, phone, code, sms_type 短信类型

# attachments 附件表
字段名 | 描述
--------- | ------- | -----------

# addresses 地理位置表
字段名 | 描述
--------- | ------- | -----------
:lat | 纬度
:lng | 经度
:addressable_id | 关联id
:addressable_type | name
:country_id | 国家
:province_id | 省
:city_id | 市
:district_id | 区
:detail_address | 详细地址

#= users 用户表
字段名 | 描述
--------- | ------- | -----------
store_id | 商户id
name | 名称
:phone | 名称
:sex | 性别
:avatar  | 头像
:authentication_token, index: true
:password_digest
:activated | 是否激活
:admin | 是否管理员
:deleted_at