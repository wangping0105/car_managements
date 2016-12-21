# 用户相关接口

## show_user
### HTTP Request

`Get /api/v1/users/:id`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
user_id | false | user's id, replace :id in 'HTTP Request'

> 返回数据示例

```json
{
  "code": 0,
  "data": {
      "id": 1,
      "created_at": "2016-03-03T03:15:55.000Z",
      "name": "admin",
      "phone": "15921076831",
      "is_store_user": false,
      "im_user": {
        "username": "qw",
        "password": "123",
        "nickname": "asda"
      }
    }
}
```

## 更新用户
### HTTP Request

`PUT /api/v1/users/:id`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
user_id | false | user's id, replace :id in 'HTTP Request'
user[name] | true | 用户名
attachment_ids[] | false | 附件id数组
> 返回数据示例

```json
{
  "code": 0,
  "data": {
      "id": 1,
      "created_at": "2016-03-03T03:15:55.000Z",
      "name": "admin",
      "phone": "15921076831",
      "is_store_user": false,
      "im_user": {
        "username": "qw",
        "password": "123",
        "nickname": "asda"
      }
    }
}
```