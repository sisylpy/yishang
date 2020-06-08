<template>

    <div class="box box-default">

        <div class="box-header with-border" style="background: #ededed; ">
            <h4 class="box-title">商品目录</h4>

            <div class="box-tools pull-right">
                <div class="btn-group">
                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-wrench"></i></button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a @click="add">新增</a></li>
                        <li><a @click="">修改</a></li>
                        <li><a >删除</a></li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="box-body">
            <ul id="menuTree" class="ztree"></ul>
        </div>
    </div>

</template>

<script>
    import api from '../../../../api/background/goods'
    export default {
        name: "nxGoodsTree",
        data:function () {
            return{

                ztree: {},
                zNodes: [],
                setting: {
                    data: {
                        simpleData: {
                            enable: true,
                            idKey: "nxGoodsId",
                            pIdKey: "nxGoodsFatherId",
                            rootPId: 0
                        },
                        key: {
                            url: "nourl",
                            name: "nxGoodsName"

                        },

                    },
                    callback: {
                        onClick: this.goodsTreeClick,
                        beforeClick: this.beforeClick,
                    },

                },

                menu: {
                    parentName: "",
                    parentId: 0,
                    type: 1,
                    orderNum: 0
                },
                secondFatherId: "",
                secondFatherName: "",
                canGet: false,
            }
        },
        mounted() {
            this.initGoodsTree();

        },
        methods:{

            goodsTreeClick:function(event,treeId,treeNode){
                console.log("ok")
                console.log(event);
                console.log(treeId);
                console.log(treeNode.tId);
                console.log(treeNode.isParent);

                if(!treeNode.isParent){
                    console.log("当前是子节点，查询数据!")
                    var zTree = $.fn.zTree.getZTreeObj("menuTree");
                    var nodes = zTree.getSelectedNodes();
                    console.log(nodes[0].nxGoodsId)


                    var obj = {
                        fatherId: nodes[0].nxGoodsId,
                        fatherName: nodes[0].nxGoodsName,

                    }
                    this.$emit('fatherObject', obj)

                }else{
                    console.log("meifanyingjiuduile?")
                }

            },
            add: function(){

                var zTree = $.fn.zTree.getZTreeObj("menuTree");
                var nodes = zTree.getSelectedNodes();
                console.log(nodes);

            },

            initGoodsTree: function () {
                api.getCateGoodsTree(0).then(res => {
                    console.log("====kankan")
                    if (res) {
                        this.zNodes = res.data
                        this.ztree = $.fn.zTree.init($("#menuTree"), this.setting, this.zNodes);


                        // var node = this.ztree.getNodeByParam("nxGoodsId", 11);
                        //
                        // console.log("kannkannode shi ???")
                        // if(node != null){
                        //     this.ztree.selectNode(node);
                        //     this.menu.parentName = node.name;
                        //
                        // }


                    }
                })

            },


        }
    }
</script>

<style scoped>

</style>