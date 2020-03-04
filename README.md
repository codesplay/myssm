# 网上电商销售系统
> 基于ssm框架的网上电商销售系统
## 环境

- spring 5.2.4
- tomcat 7.0
- mybatis 5.1.6
### 结构：

``` 
src
├── java/pers/myssm
|	  ├── controller -- 控制层
|	  ├── dao -- 持久层
|	  ├── domain -- javabean 实体对象
|	  ├── service -- 业务层
|	  └── utils -- 工具类
├── resources -- xml配置文件
└── webapp -- jsp、html页面
```



## 基本功能

### 1. 用户界面

1. 用户登录注册
2. 商品购买
3. 用户订单
4. 用户购物车
5. 商品评价
### 2. 管理员界面

1. 商品添加、删除及修改
2. 用户修改、删除
3. 订单修改、删除
## TODO LIST

- 完善事务管理
- 完善异常处理
- 添加用户信息编辑界面
- 高并发处理