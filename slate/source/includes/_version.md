# 版本 Version
## 最新版本
### HTTP Request

`GET  /api/v1/users//versions/lastest_version`

### URL Parameters

字段名 | 是否必填 | 描述
--------- | ------- | -----------
device | true | in ['android', 'ios']

- 其中的upgrade 有 [:notice, :suggest, :force] 三种值 升级消息,建议升级,强制升级,为空则不处理

> 返回数据示例

```json
{
  "code": 0,
  "data": {
    "name": "chekoubei",
    "app_type": "android",
    "version_name": "1.0.0",
    "version_code": "1.0.0",
    "download_url": "",
    "upgrade": "",
    "changelogs": ""
  }
}
```