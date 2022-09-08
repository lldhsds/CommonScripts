应用场景：
修改Linux系统密码，执行passwd即可更改密码。可如果有成千上百台服务器呢，通过ssh的方式逐一进行修改，对我们来说，工作量是非常大，且效率非常低下。因此采用批量修改密码的方式是比较快的。

依赖：
在Linux环境下运行，需要tcl和expect支持

expect常用命令：
expect              获取上一命令执行后的返回信息，如果匹配成功 则执行后续操作
spawn               交互程序开始后面跟命令
set                 定义变量
puts                输出变量
set timeout         设置超时时间
send         　　    用于发送字符串或者命令
exit                退出expect脚本
eof                 expect执行结束 退出
interact            结束

action.exp脚本解释：
第1行告诉操作系统，以下脚本代码使用expect解释器来执行。
第2行及第3行使用[lindex $argv n],表示变量ipaddr及passwd接受从bash传递过来的参数，从0开始，分别表示第一个，第二个参数。这里表示从passwd.sh脚本中提取出来的ip及密码
第4行设定了本脚本所有的超时时间，单位是秒(s)
第5行利用spawn命令启动ssh会话连接
第6-9行expect {}代表多行期望；当匹配到yes/no时，自动输入yes并执行回车动作；匹配到password时，自动输入密码并回车。
第11行不用多解释了吧，登录上远程服务器后，将密码修改为123456
第12及13行表示退出expect；其中expect eof与spawn对应，表示捕获终端输出信息的终止。

参考链接：
https://mp.weixin.qq.com/s/oxtrFtVTAvfOrdvw1RWoSA
https://cloud.tencent.com/developer/article/1678666
https://www.cnblogs.com/saneri/p/10819348.html
