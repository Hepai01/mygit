# SpringBoot and vue

#### 介绍
包含作者参与开发的一些项目

#### 软件架构
关于collegeNews项目，前端代码为boot-vue,后端代码为boot_vue，shareTrip为uniappx项目，后端相关环境为SpringBoot3+jdk17,数据库环境包含mysql以及redis，前端相关环境为vue3以及node.js


#### 安装教程

1.  后端文件用idea打开后初试化pom.xml用maven安装依赖
2.  前端文件用node在总目录处打开后执行npm -install
3.  在mysql数据库中运行项目给的示例sql文件
4.  shareTrip项目需在HBuild X中安装uv-vi、uni-icons、uni-list

#### 使用说明

1.  后端：运行boot_vueApplication、mysql以及redis
2.  前端：npm run dev

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request

#### 介绍

1. **武汉学院新闻平台**

   技术架构：

   ​      前后端分离：后端提供 RESTful API，前端通过路由和状态管理实现模块化开发，提升代码复用性和可维护性

   ​      全局异常处理：优化统一异常捕获机制，增强系统容错能力，便于快速定位和修复问题

   技术栈：SpringBoot + MyBatis + Redis + 阿里云OSS + Vue3 + Axios + Vuex + MySql

   前端技术：

   - 响应式开发：基于 Vue 3 框架，搭配 Element-Plus 组件库，构建动态、高交互的用户界面。
   - 状态管理：采用 Pinia 和 Vuex 实现全局状态管理，优化多组件间数据流转效率。
   - 工程化实践：通过 Vue Router 实现动态路由管理，结合 Axios 拦截器优化 HTTP 请求，支持异步数据处理。

   后端技术：

   - 高性能框架：基于 SpringBoot 3 构建，结合 JDK 17 特性，提升系统运行效率。
   - 安全认证：采用 JWT 令牌验证与 Redis 缓存结合，优化用户登录流程，保障接口安全性。
   - 数据库交互：集成 MyBatis 框架，通过 XML 文件灵活控制 SQL 语句，增强数据操作的安全性和可维护性。
   - 数据校验：使用 @Validated 注解实现参数校验，结合自定义校验逻辑，提升接口健壮性。

   

   存在问题：刷新后管理员将不能看到自己权限能获得的按钮

   解决方法：统一使用pinia进行持久化，这样判断用户权限的变量会一直存在

   存在问题：管理员登录后退出登录是，如果不刷新那么同一电脑的普通用户也将得到管理员权限，同样管理员在普通用户登录后也需要刷新后才能看到管理员可以操作的按钮

2. **基于uniappx开发的旅游微信小程序**

   项目介绍：

   ​      旅游景点展示小程序，包含首页瀑布流推荐、景点详情展示、游玩项目推荐和个人中心四大核心模块。系统需支持高并发景点信息展示，通过组件化开发和性能优化保障流畅交互体验。

   技术栈：uni-app x + uv-ui + uts + uvue + Vue3 Composition API + TypeScript + 腾讯地图SDK

   我的职责：

   - 设计动态路由方案，支持景点ID直达详情页，实现多角色界面差异化渲染，组件复用率达70%
   - 封装uv-waterfall瀑布流组件，支持双列动态布局，首页瀑布流实现触底加载，支持大量景点数据流畅渲染
   - 使用JSON.parse优化详情页数据传递效率，加载速度提升40%，设计前端缓存策略（LocalStorage + Memory Cache），用户信息请求频次降低60%
   - 集成高德地图SDK，实现景点位置标记与导航功能，开发微信授权模块，支持头像/昵称安全获取
   - 使用rpx响应式单位适配不同设备屏幕，通过条件编译处理微信小程序与H5平台差异
   - 抽象api/api.uts统一接口管理，支持TypeScript强类型校验,封装uv-ui业务组件库，减少重复代码
