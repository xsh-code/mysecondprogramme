var origin="http://localhost:8989/web03";//声明请求的域
$(function(){
    var option = {
        url: origin+'/sys/menu/list',
        pagination: true,	//显示分页条
        sidePagination: 'server',//服务器端分页
        showRefresh: true,  //显示刷新按钮
        search: true,//是否显示搜索框
        toolbar: '#toolbar',
        striped : true,     //设置为true会有隔行变色效果
        //idField: 'menuId',
        columns: [
            {
                field: 'menuId',
                title: '序号',
                width: 40,
                formatter: function(value, row, index) {
                    var pageSize = $('#table').bootstrapTable('getOptions').pageSize;
                    var pageNumber = $('#table').bootstrapTable('getOptions').pageNumber;
                    return pageSize * (pageNumber - 1) + index + 1;
                }

            },
            {checkbox:true},
            { title: '菜单ID', field: 'menuId',sortable:true},
            {field:'name', title:'菜单名称', formatter: function(value,row){
                    if(row.type === 0){
                        return value;
                    }
                    if(row.type === 1){
                        return '<span style="margin-left: 40px;">├─ ' + value + '</span>';
                    }
                    if(row.type === 2){
                        return '<span style="margin-left: 80px;">├─ ' + value + '</span>';
                    }
                }},
            { title: '上级菜单', field: 'parentName'},
            { title: '菜单图标', field: 'icon', formatter: function(value){
                    return value == null ? '' : '<i class="'+value+' fa-lg"></i>';
                }},
            { title: '菜单URL', field: 'url'},
            { title: '授权标识', field: 'perms'},
            { title: '类型', field: 'type', formatter: function(value){
                    if(value === 0){
                        return '<span class="label label-primary">目录</span>';
                    }
                    if(value === 1){
                        return '<span class="label label-success">菜单</span>';
                    }
                    if(value === 2){
                        return '<span class="label label-warning">按钮</span>';
                    }
                }},
            { title: '排序号', field: 'orderNum'}
        ]};
    $('#table').bootstrapTable(option);
});
var ztree;

var vm = new Vue({
	el:'#dtapp',
    data:{
        showList: true,
        title: null,
        menu:{}
    },
    methods:{
        del: function(){

            //var rows = getSelectedRows();
            /**
             * getSelections
             参数： undefined
             详情：
             返回选定的行，如果未选择任何记录，则返回一个空数组。
             */
            var rows = $("#table").bootstrapTable("getSelections")
            //[]
            if(rows == null||rows.length==0){
                alert('请选择您要删除的行');
                return ;
            }
            var id = 'menuId';
            //提示确认框  layer huozhe sweetalert
            layer.confirm('您确定要删除所选数据吗？', {
                btn: ['确定', '取消'] //可以无限个按钮
            }, function(index, layero){
                var ids = new Array();
                //遍历所有选择的行数据，取每条数据对应的ID
                $.each(rows, function(i, row) {
                    console.log(row[id]);
                    ids[i] = row[id];
                });

                $.ajax({
                    type: "POST",
                    url: "/sys/menu/del",
                    data: JSON.stringify(ids),
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
            vm.menu = {parentName:null,parentId:0,type:0,orderNum:0};
            vm.getMenu();
        },
        update: function (event) {
            var id = 'menuId';
            var menuId = getSelectedRow()[id];//common.js
            if(menuId == null){
                return ;
            }
            //sys/menu/info/1
            $.get("../sys/menu/info/"+menuId, function(r){
                vm.showList = false;
                vm.title = "修改";
                vm.menu = r.menu;

                vm.getMenu();
            });
        },
        saveOrUpdate: function (event) {
            var url = vm.menu.menuId == null ? "../sys/menu/save" : "../sys/menu/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.menu),
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
        menuTree: function(){//点击菜单输入框时执行
            layer.open({// layer.open();弹框，其中显示Ztree
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择菜单",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: $("#menuLayer"),//将ztree放入layer
                btn: ['确定', '取消'],
                btn1:function(index){//第一个按钮：确定
                    var node = ztree.getCheckedNodes(true);
                    console.log(node);
                    //选择上级菜单
                    vm.menu.parentId = node[0].menuId;
                    vm.menu.parentName = node[0].name;

                    layer.close(index);
                }/*,
                btn2: function (index) {//第二个按钮：取消

                }*/
            });

            //设置ztree的数据
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
                    chkStyle: "radio",//显示 checkbox 选择框，默认checkbox可选择值radio
                    radioType: "all" // 所有节点为一个选择组，全局互斥
                },
                callback: {
                    beforeCheck:function(treeId, treeNode) {
                        if(treeNode.type==0){
                            return false;
                        }
                    },
                    onCheck: function(event, treeId, treeNode) {//每次选中或取消选中一个ztree节点时触发
                        console.log(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
                        console.log(treeNode.menuId);
                        vm.menu.menuId = treeNode.tId;//存入vm.role.menu,准备发往后端
                    }
                }
            }
            ztree = $.fn.zTree.init($("#menuTree"), setting, vm.menu.data);
            // 重置ztree的节点,如果是添加一级菜单则只显示顶级菜单，添加二级菜单则只显示一级菜单
            var nodes = ztree.getNodesByFilter(function (node){
                return node.type==vm.menu.type;
            });
            //删除和自己同级的菜单
            for(var i=0;i<nodes.length;i++){
                ztree.removeNode(nodes[i]);
            }
        },
        getMenu: function(menuId){//加载ztree的数据，点击菜单"增加"时执行
            //加载菜单树
            $.get(origin+"/sys/menu/select?_"+$.now(),
                function(r){
                //将所有菜单信息存入vm.menu
                vm.menu.data=r.menuList;
                //编辑（update）时，打开tree，自动高亮选择的条目
                //var node = ztree.getNodeByParam("menuId", vm.menu.parentId);
                //选中tree菜单中的对应节点
                //ztree.selectNode(node);
                //编辑（update）时，根据当前的选中节点，为编辑表单的“上级菜单”回填值
                //vm.menu.parentName = node.name;
            });
        }
    }
});