!各文件夹描述:
api:二次封装axios发送网络请求
assets:字体图标等全部组件共用的静态资源
components:非路由组件(静态组件)
pages:路由组件
router:路由规则
store:vuex
app.vue:根组件
main.js:入口文件
vue.config.js:wabpack配置文件

1.使用vue-cli脚手架初始化项目
node+webpack+淘宝镜像

node_modules文件夹:项目依赖文件

public文件夹:放置一些静态资源（图片）,文件夹里的资源在webpack打包的时候会原封不动的打包到dist文件夹中

src文件夹:
	assets文件夹:多个组件共用的静态资源,打包的时候会打包到js文件里
		
	components文件夹:非路由组件（全局组件）
	
	App.vue:唯一根组件
	
	main.js:入口文件,最先开始执行的文件
babel.config.js:babel配置相关的文件

package.json:记录项目的一些信息（依赖,怎么运行...）

package-lock.json:缓存文件

README.md:说明文件

2.项目其他配置

2.1项目运行让浏览器自动打开
vue.config.js里devServer:{open:true}

2.2关闭语法校验
vue.config.js里lintOnSave:false

2.3给src文件夹配置别名 @就代表src文件夹，后面文件过多方便查找
jsconfig.json里配置
{
	"compilerOptions":{
		"baseUrl":"./",
		"paths":{
			"@/*":["src/*"]
		}
	},
	"exclude":["node_modules","dist"]
}

3.项目路由分析
vue-router

路由组件:
home首页路由组件、search路由组件、login登录路由、refister注册路由
非路由组件:
header、footer（首页登录页有,登录页面没有）

路由组件搭建
路由组件有4个:Home,Search,Login,Register
-components文件夹放置非路由组件（全局组件）
-pages/views文件夹放置路由组件

配置路由
配置的路由一般放置在router文件夹

$route:一般获取路由信息(路径,query,parmas等)
$router:进行编程式导航进行路由跳转(push/replace)

路由跳转
路由跳转有两种形式:
声明式路由跳转:router-link
编程式路由跳转:push/replace

4.1判断footer组件的显示和隐藏,可以利用路径v-show="$route.path=='/home'"判断
4.2也可以通过配置路由元信息,在路由文件给配置路由上添加meta属性携带信息,通过$route.meta获取

5.1路由传参
parmas参数:this.$router.push('/home/'+this.keyword)
需路由中占位
接收:this.$route.params.k
query参数:this.$router.push('/home/?k='+this.keyword)
接收:this.$route.query.k

6.拆分组件

7.axios 二次封装
为什么需要二次封装？ 请求拦截器，响应拦截器 处理一些事情