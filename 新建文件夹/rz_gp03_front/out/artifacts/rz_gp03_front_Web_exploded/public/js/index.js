var origin = "http://localhost:8080/xshrz01";
//var origin="http://10.9.61.251:8989/web";//声明请求的域
//var origin="http://10.9.61.128:8989/web";//声明请求的域
$.ajaxSetup({
    xhrFields: {
        withCredentials: true //跨域携带cookie
    }
});
//生成菜单
var menuItem = Vue.extend({
	name: 'menu-item',
	props:{item:{}},
	template:[
	          '<li>',
				  '<a v-if="item.type === 0" href="javascript:;">',
					  '<i v-if="item.icon != null" :class="item.icon"></i>',
					  '<span>{{item.name}}</span>',
					  '<i class="fa fa-angle-left pull-right"></i>',
				  '</a>',
				  '<ul v-if="item.type === 0" class="treeview-menu">',
				  	'<menu-item :item="item" v-for="item in item.list"></menu-item>',
				  '</ul>',
				  '<a v-if="item.type === 1" :href="\'#\'+item.url">',
				  	'<i v-if="item.icon != null" :class="item.icon"></i>',
					'<i v-else class="fa fa-circle-o"></i> {{item.name}}',
		          '</a>',
	          '</li>'
	].join('')
});

//iframe自适应
$(window).on('resize', function() {
	var $content = $('.content');
	$content.height($(this).height() - 120);
	$content.find('iframe').each(function() {
		$(this).height($content.height());
	});
}).resize();

//注册菜单组件
Vue.component('menuItem',menuItem);
var vm = new Vue({
	el:'#dtapp',
	data:{
		user:{},
		menuList:{},
		main:"sys/main.html",
		password:'',
		newPassword:'',
        navTitle:"控制台"
	},
	methods: {
		getMenuList: function (event) {
			$.getJSON(origin+"/sys/menu/user?_"+$.now(), function(r){
				vm.menuList = r.menuList;
                window.permissions = r.permissions;
			});
		},
		getUser: function(){
			$.getJSON(origin+"/sys/user/info?_"+$.now(), function(r){
				vm.user = r.user;
			});
		},
		//退出
        logout:function(){
			$.get(origin+"/logout",function(r){
				if(r.code==0){
					location.href = "login.html";
				}
			});
		},

		login:function(){
            console.log(vm.user);
            console.log(this.user);
			//if(!this.user) {
                location.href = "login.html";
            //}
		},
		updatePassword: function(){
			layer.open({
				type: 1,
				skin: 'layui-layer-molv',
				title: "修改密码",
				area: ['550px', '270px'],
				shadeClose: false,
				content: jQuery("#passwordLayer"),
				btn: ['修改','取消'],
				btn1: function (index) {
					var data = "password="+vm.password+"&newPassword="+vm.newPassword;
					$.ajax({
						type: "POST",
					    url: "sys/user/password",
					    data: data,
					    dataType: "json",
					    success: function(result){
							if(result.code == 0){
								layer.close(index);
								layer.alert('修改成功', function(index){
									location.reload();
								});
							}else{
								layer.alert(result.msg);
							}
						}
					});
	            }
			});
		}
	},
	created: function(){//调用如下两个方法
		this.getMenuList(); // 获得首页菜单栏信息
		this.getUser(); // 获得用户信息
	},
	updated: function(){
		//路由
		var router = new Router();
		routerList(router, vm.menuList);
		router.start();
	}
});



function routerList(router, menuList){
	for(var key in menuList){
		var menu = menuList[key];
		if(menu.type == 0){
			routerList(router, menu.list);
		}else if(menu.type == 1){
			router.add('#'+menu.url, function() {
				var url = window.location.hash;

				//替换iframe的url
			    // vm.main = url.replace('#', '')+"?_"+$.now();
document.getElementById("main").src=url.replace('#', '')+"?_"+$.now();
			    //导航菜单展开
			    $(".treeview-menu li").removeClass("active");
			    $("a[href='"+url+"']").parents("li").addClass("active");

			    // vm.navTitle = $("a[href='"+url+"']").text();
				$("#navTitle").text($("a[href='"+url+"']").text());
			});
		}
	}
}