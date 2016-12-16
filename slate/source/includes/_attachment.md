# 附件上传
## 单个附件上
### HTTP Request

`POST  /api/v1/attachment/upload`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
attachment[file] | true | 文件名
attachment[attachmentable_type] | false | 对象类型 比如传 User,具体用到再说
attachment[attachmentable_id] | false | 对像id

> 返回数据示例

```json
{
  code: 0,
  data:{
       "id": 8,
       "file_url": "/system/attachments/files/000/000/008/original/demo_car.png?1458469347",
       "name": "",
       "file_file_name": "demo_car.png",
       "file_content_type": "image/png",
       "file_file_size": 514172,
       "user_name": "admin",
       "attachmentable_id": 4,
       "attachmentable_type": "Car",
       "upload_time": "2016-03-20 10:22"
   }
}
```
