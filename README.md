# 网上电商销售系统
> 基于ssm框架的网上电商销售系统
## 环境
- spring 5.0.2
- tomcat 7.0
- mybatis 5.1.6
## 基本功能
### 用户界面
1. 用户登录注册
2. 商品购买
3. 用户订单
4. 用户购物车
5. 商品评价
### 管理员界面
1. 商品添加、删除及修改
2. 用户修改、删除
3. 订单修改、删除
### 待实现
- 商品评价显示
- 用户信息编辑界面
### 组织结构
├── README.md                   
├── src                               
│   └── main   
│       ├── java  
│       |     ├── pers.myssm.controller    
│       |     ├── pers.myssm.service -- 各种业务接口   
│       |     ├── pers.myssm.serviceimpl -- 接口实现类  
│       |     ├── pers.myssm.dao -- 持久层  
│       |     ├── pers.myssm.domain -- 实例  
│       │     └── pers.myssm.utils -- 工具类        
│       ├── resources -- spring及springmvc 配置文件  
│       └── webapp -- jsp页面        
└── pom.xml  


