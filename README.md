# DormitorySystem
## 宿舍管理系统

springSecurit

aspectj

log4j2

layui框架

首页模块，公告模块，学生模块，宿舍模块，专业模块，宿舍卫生模块，管理员模块，个人信息模块，日志模块

实现了管理员的登录登出，管理员对各个模块的增删改查，个别模块实现了关联查询，关联操作。

通过Spring security BCryptPasswordEncoder来对管理员的密码进行加密。

通过springSecurity来实现一些模块和方法只有超级管理员才能查看操作，例如超级管理员可以增删改查普通管理员。

通过log4j2将sql语句输出打印到控制台。

通过Aspectj在某些方法执行后会产生一条数据，数据包括执行时长，执行ip，执行用户，方法名称，全限定类名，记录在数据库的syslog表中。

**提供账号**
账号：tom 密码：123     其余账户密码也是123.

