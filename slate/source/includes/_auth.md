# 用户登录接口
## 登录
### HTTP Request

`POST  /api/v1/auth/login`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
phone | true | 电话
password | true | mi码

> 返回数据示例

```json
{
  "code": 0,
  "data": {
    "user": {
      "id": 1,
      "name": "平神",
      "phone": "15921076830",
      "is_store_user": true,
      "identify_status": "ok", # ok 就是通过验证, not 就是没通过
      "file_url": "/system/attachments/files/000/000/001/original/demo.jpg?1459908250", # 图片
      "tags": [],
      "im_user": {
        "username": "user1",
        "password": "123456",
        "nickname": "平神"
      },
      "created_at": "2016-04-06T02:04:09.000Z"
    },
    "user_token": "3e761f4b31d3299187814d7385998f0c"
  }
}
```

## 手机验证码发送
### HTTP Request

`GET  /api/v1/auth/send_verification_code`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
sms_type | true | 类型，值 in ['sign_up', 'change_pwd']
phone | true | 电话


> 返回数据示例

```json
{
  "code": 0
}
```

## 注册
### HTTP Request

`POST  /api/v1/auth/sign_up`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
code | true | 验证码
phone | true | 电话
password | true | mi码

> 返回数据示例

```json
{
  "code": 0,
  "data": {
    "user": {
      "id": 1,
      "created_at": "2016-03-03T03:15:55.000Z",
      "name": "admin",
      "phone": "15921076831",
      "is_store_user": false
    },
    "user_token": "019c0438d2843820d087db7ba1a41b33da97500d"
  }
}
```

## 修改密码
### HTTP Request

`PUT  /api/v1/auth/change_password`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
code | true | 验证码
phone | true | 电话
password | true | 新的密码

> 返回数据示例

```json
{
  "code": 0,
  "data": {
    "user": {
      "id": 1,
      "created_at": "2016-03-03T03:15:55.000Z",
      "name": "admin",
      "phone": "15921076831",
      "is_store_user": false
    },
    "user_token": "019c0438d2843820d087db7ba1a41b33da97500d"
  }
}
```