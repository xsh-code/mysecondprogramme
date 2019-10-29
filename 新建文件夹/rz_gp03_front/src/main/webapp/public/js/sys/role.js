var origin="http://localhost:8989/web03";//声明请求的域
//var origin="http://10.9.61.251:8989/web
$(function(){
    var option = {
        url: origin+'/sys/role/list?_'+$.now(),
        pagination: true,	//显示分页条
        sidePagination: 'server',//服务器端分页
        showRefresh: true,  //显示刷新按钮
        search: true,//是否显示搜索框
        toolbar: '#toolbar',
        striped : true,     //设置为true会有隔行变色效果
        pageSize:3,
        columns: [
            {checkbox:true},
            { title: '角色ID', field: 'roleId',sortable:true},
            { title:'角色名', field:'roleName'},
            { title: '描述', field: 'remark'},
            { title: '创建时间', field: 'createTime'},
        ]};
    $('#table').bootstrapTable(option);
});

var vm = new Vue({
	el:'#dtapp',
    data:{
        showList: true,
        title: null,
        role:{menus:[]},//和添加、更新中的 roleName  remark 双向绑定,其中还保存对应的带单id
                       // 新增role时保存选中的所有menu。
                       // 更新role时保存查询到的初始menu和修改后的menu
        //roles:[] //所有角色,用于遍历出所有的角色，以供选择
        //menu:[] //保存 添加、更新中的 菜单id
    },
    methods:{
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
                var roleId = rows[0].roleId;
                $.ajax({
                    type: "DELETE",
                    url: origin+"/sys/roles/"+roleId+'?_'+$.now(),
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
            vm.role={menus:[]};
            console.log("add==");
            console.log(vm.role);
            console.log("add==22");
            vm.getMenu();
        },
        update: function (event) {
            var roleId = getSelectedRow().roleId;//common.js
            if(roleId == null){
                return ;
            }

            //sys/role/info/1
            $.get(origin+"/sys/role/info/"+roleId+'?_'+$.now(), function(r){
                vm.showList = false;
                vm.title = "修改";
                vm.role = r.role;//获取到 角色信息和menu信息
                vm.getMenu();
            });
        },
        saveOrUpdate: function (event) {
            console.log(vm.role.roleId);
            // 通过判断当前role是否有roleId,来决定时添加 或是 更新
            var url = vm.role.roleId ? "/sys/role/update" : "/sys/role/save";
            $.ajax({
                type: "POST",
                url: origin+url+'?_'+$.now(),
                data: JSON.stringify(vm.role),
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
        getMenu: function(){//加载ztree，显示所有菜单
            var setting = {
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "menuId",
                        pIdKey: "parentId",
                        rootPId: -1
                    },
                    key: {
                        url: "nourl"
                    }
                },
                check: {
                    enable: true,
                    chkStyle: "checkbox"//显示 checkbox 选择框，默认checkbox可选择值radio
                },
                callback: {
                    onCheck: function(event, treeId, treeNode) {//每次选中或取消选中一个ztree节点时触发
                        console.log(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
                        var zTree = $.fn.zTree.getZTreeObj("menuTree");
                        //checkCount = zTree.getCheckedNodes(true).length,// 获得所有选中的 ztree节点
                        //nocheckCount = zTree.getCheckedNodes(false).length,//未选中
                        //changeCount = zTree.getChangeCheckedNodes().length;//获取输入框勾选状态被改变的节点集合（与原始数据 checkedOld 对比）
                        var checkedNames = [],checkedIds = [];//存储被选中节点中的信息
                        for (var i = 0; i <= zTree.getCheckedNodes(true).length - 1; i++) {
                            checkedIds.push(zTree.getCheckedNodes(true)[i].menuId);//存储所有被选中节点中的 menuId信息
                        };
                        console.log(checkedIds);
                        vm.role.menus = checkedIds;//存入vm.role.menu,准备发往后端
                    }
                }
            }
            //加载菜单树
            $.get(origin+"/sys/menu/select?_"+$.now(),
                function(r){
                    //设置ztree的数据
                    ztree = $.fn.zTree.init($("#menuTree"), setting, r.menuList);
                    if(vm.role.roleId) {//点击更新按钮，会查询对应role，并存在vm中，所以是有roleId的
                        console.log("更新回显数据");
                        var menuIds = vm.role.menus;//当前role的原始菜单项
                        console.log("更新");
                        console.log(menuIds);
                        for(var i=0;i<menuIds.length;i++) {
                            console.log("menuId:"+menuIds[i]+" ------")
                            var node = ztree.getNodeByParam("menuId", menuIds[i]);
                            console.log("node:"+node+" =======")
                            //选中tree菜单中的对应节点
                            ztree.checkNode(node,true);
                            // //编辑（update）时，根据当前的选中节点，为编辑表单的“上级菜单”回填值
                            // vm.menu.parentName = node.name;
                        }
                    }
                });
        }

    }
});