# dockerimage-filebeat

**警告**: ⚠️ 本项目并没有经过严格测试，不可用于生产环境。

### 单节点

```yaml
version: "3.7"

services:
  filebeat:
    image: registry.cn-shanghai.aliyuncs.com/yingzhuo/filebeat:5.6.16
    container_name: filebeat
    restart: "always"
    volumes:
      - "${PWD}/log/:/var/log/"
    environment:
      - "LOG_PATH=/var/log/*.json"
      - "ES_HOSTS=192.168.99.114:9200"
      - "ES_INDEX=my-index-%{+yyyy-MM-dd}"
```

### 配置 (Env)

name                  | 默认值    | 如果不设置             | 示例
----------------------|----------|-----------------------|--------------------------------------------------------------------
LOG_PATH              | <none>   | 启动失败               | /var/log/*.json
FIELD                 | <none>   | 不设置                 | app=nurse,layer=facade
ES_HOSTS              | <none>   | 启动失败               | 192.168.99.114:9200,192.168.99.115:9200,192.168.99.116:9200
ES_PROTOCOL           | http     | 使用默认值              | https
ES_USERNAME           | <none>   | 不使用ES http-basic认证 | elastic
ES_PASSWORD           | <none>   | 不使用ES http-basic认证 | changeme
ES_INDEX              | <none>   | 启动失败                | my-index-%{+yyyy-MM-dd}
