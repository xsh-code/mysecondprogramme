var origin="http://localhost:8080/xshrz01";//声明请求的域
//var origin="http://10.9.61.251:8989/web";//声明请求的域
//var origin="http://10.9.61.128:8989/web";//声明请求的域
$(function(){
    var option = {
        url: origin+'/sys/user/list?_'+$.now(),
        pagination: true,	//显示分页条
        sidePagination: 'server',//服务器端分页
        showRefresh: true,  //显示刷新按钮
        search: true,//是否显示搜索框
        toolbar: '#toolbar',
        striped : true,     //设置为true会有隔行变色效果
        pageSize:3,
        columns: [
            {checkbox:true},
            { title: '用户ID', field: 'userId',sortable:true},
            { title:'用户名', field:'username'},
            { title: '密码', field: 'password', formatter: function(value){return '******';}},
            { title: '邮箱', field: 'email'},
            { title: '手机号', field: 'mobile'},
            { title: '创建时间', field: 'createTime'},
            { title: '性别', field: 'sex'},
            { title: '状态', field: 'status',formatter:function(v,r,i){return v==1?"可用":"冻结"}}
        ]};
    $('#table').bootstrapTable(option);
});

var vm = new Vue({
	el:'#dtapp',
    data:{
        showList: true,
        title: null,
        user:{roles:[]}, //新增用户时选择的role; 更新用户时选择的role;与页面的角色双向绑定
        roles:[] //所有角色,用于遍历出所有的角色，以供选择
    },
    methods:{
        exportExcel:function(){
            console.log("导出！");
            location.href=origin+"/sys/exportExcel";
        },
        del: function(){
            var rows = $("#table").bootstrapTable("getSelections")
            //[]
            if(rows == null||rows.length==0){
                alert('请选择您要删除的行');
                return ;
            }
            if(rows.length>1){
                alert('不要选中多行');
                return ;
            }
            //提示确认框  layer huozhe sweetalert
            layer.confirm('您确定要删除所选数据吗？', {
                btn: ['确定', '取消'] //可以无限个按钮
            }, function(index, layero){
                var userId = rows[0].userId;
                $.ajax({
                    type: "POST",
                    url: origin+"/sys/user/del/"+userId+'?_'+$.now(),
                    success : function(r) {
                        if(r.code === 0){
                            layer.alert('删除成功');
                            $('#table').bootstrapTable('refresh');
                        }else{
                            layer.alert(r.msg);
                        }
                    },
                    error : function() {
                        layer.alert('服务器没有返回数据，可能服务器忙，请重试');
                    }
                });
            });
        },
        add: function(){
            vm.showList = false;
            vm.title = "新增";
            vm.user={roles:[]};//新增时，清空用户信息
        },
        update: function (event) {
            var userId = getSelectedRow().userId;//common.js
            if(userId == null){
                return ;
            }

            ///sys/user/info/{userId}
            $.get(origin+"/sys/user/info/"+userId+'?_'+$.now(), function(r){
                console.log("query in update :"+r);
                vm.showList = false;
                vm.title = "修改";
                vm.user = r.user;
            });
        },
        saveOrUpdate: function (event) {
            console.log(vm.user);
            // 通过判断当前user是否有userId,来决定时添加 或是 更新
            var url = vm.user.userId == null ? "/sys/user/save" : "/sys/user/update";
            $.ajax({
                type: "POST",
                url: origin+url+'?_'+$.now(),
                data: JSON.stringify(vm.user),
                success: function(r){
                    if(r.code === 0){
                        layer.alert('操作成功', function(index){
                            layer.close(index);
                            vm.reload();
                        });
                    }else{
                        layer.alert(r.msg);
                    }
                }
            });
        },
        reload: function (event) {
            vm.showList = true;
            $("#table").bootstrapTable('refresh');
        },
        loadRoles:function(){//加载所有角色
            $.ajax({
                type: "GET",
                url: origin+"/sys/roles?_"+$.now(),
                success: function(r){//返回所有role:{code:0,roles:[{id:xx,roleName:"xxx"},{...},...]}
                    if(r.code === 0){
                        vm.roles = r.roles;
                    }else{
                        layer.alert(r.msg);
                    }
                }
            });
        }
    },
    created:function(){
        this.loadRoles();
    }
});