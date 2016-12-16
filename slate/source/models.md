---
title: API Reference

language_tabs:
  - shell
  - ruby

toc_footers:
  - <a href='index.html'>api首页</a>
  - <a href='models.html'>数据表设计</a>

includes:
  - database/design

search: true
---


注意：登录成功后，可以在请求参数中携带身份验证信息（即在请求参数中传user_token、version_code、device），也可以将身份信息放到请求头的Authorization里，即在每个请求头中都加入如下参数：


`Authorization: Token token="{{user_token}}",version_code="{{version_code}}",device="{{device}}"`



# 所有的app接入接口

> API 统一返回的格式:

> 正确结果:

```json

   { "code": 0, "data": {} }
```

> 错误结果:

```json

   { "code": -1, "message": "" }
```

### 全局输入参数说明

字段名 | 是否必填 | 描述
--------- | ------- | -----------
access_token | true | 必须要有的
user_token | true | 必须要有的（除了登陆接口）
version_code | true | 必须要有的
device | true | 设备类型（ios, android）


### 全局返回参数说明

字段名 | 数据类型 | 描述
--------- | --------- | -----------
code | int | 返回代码，`0` 表示返回结果正常，其它值表示出错
message | string | 错误消息（当`code`不为`0`时，返回该字段）
data | json | 实际数据（当`code`为`0`时，返回该字段）
total_count | int | 数据总条数（非当前结果集条数，`data`字段中的值）
per_page | int | 每页的数量（`data`字段中的值）
page | int | 页码（`data`字段中的值）



<aside class="notice">
注意哦，返回数据在右侧 <code>ruby</code> 别忘记哦！
</aside>
