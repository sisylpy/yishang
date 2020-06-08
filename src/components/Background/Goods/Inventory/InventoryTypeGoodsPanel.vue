<template>

    <div class="content">


        <div class="col-md-2 category">

            <div class="box box-solid">

                <div class="box-header with-border" style="background: #ededed; "></div>

                <div class="box-body no-padding">
                    <ul class="nav nav-pills nav-stacked" id="products">
                        <!--<li class="active"><a>Inbox</a></li>-->
                        <li v-for="(item,index) in goodsArr" v-bind:key="item.id" :id="item.goodsId"
                            :class="isactive == index ? 'active' : '' "
                            @click='onclickProducts(index, item.nxGoodsId,item.nxGoodsName)'>
                            <a >{{item.nxGoodsName}}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="col-md-10">

            <div class="content container-fluid box box-default no-padding" id="jqbody">

                <div class="box-header">
                    <h3 class="box-title">{{fatherName}}</h3>

                    <div class="box-tools">
                        <div class="btn-group pull-left" style="margin-right: 30px;">
                            <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-wrench"></i></button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a @click="add">新增商品</a></li>
                                <li><a @click="update">修改商品</a></li>
                                <li><a @click="del">删除商品</a></li>
                                <li class="divider"></li>
                                <li><a @click="addCate">新增商品大类</a></li>
                                <li><a @click="updateCate">修改商品大类</a></li>
                                <li><a @click="delOne">删除商品大类</a></li>
                                <li class="divider"></li>
                                <li><a @click="importGoods">导入</a></li>
                                <li><a @click="downloadGoods">导出</a></li>
                            </ul>
                        </div>


                        <div class="input-group input-group-sm hidden-xs" style="width: 150px;">
                            <input type="text" name="table_search" v-model="words" class="form-control pull-right"
                                   placeholder="Search">
                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-default" @click="searchGoods">
                                    <i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="box-body no-padding">
                    <table id="jqGridInventory"></table>
                    <div id="jqGridPagerInventory"></div>
                </div>

            </div>

        </div>

        <AddGoods :fatherName="fatherName" :fatherId="fatherId" :editGoodsId="editGoodsId" :secondFatherId="secondFatherId"
                  @submit-add="getJqtableData "/>
    </div>
</template>

<script>
    import InventoryTypeGoodsTable from '@/components/Background/Goods/Inventory/InventoryTypeGoodsTable.vue'
    import api from '../../../../api/background/goods'
    import importGoods from '@/components/Background/Goods/ImportGoods.vue'
    import AddGoods from '@/components/Background/Goods/Inventory/AddGoodsInventory.vue'

    export default {
        name: "InventoryTypeGoodsPanel",
        props: ['secondFatherId'],

        components: {
            InventoryTypeGoodsTable,
            importGoods,
            AddGoods,
        },
        data() {
            return {
                goodsArr: [],
                isactive: 0,
                fatherId: "",
                fatherName: "",
                page: 1,
                limit: 200,
                goodsList: [],
                tableName: "没有数据，请刷新页面",
                editGoodsId: null,
                fatherArr: [],
                words: "",

            }
        },
        watch: {
            $route(){
                console.log("rrrrrrr???????")
                this.firstGoodsId = this.$route.params.fatherId
            },
            secondFatherId: function (newVal, oldVal) {
                console.log("watch secondFatherId")
                if (newVal  !== oldVal) {
                    console.log("!==")
                this.secondFatherId = newVal;
                this.getCateGoodsArr(newVal)
            }
            },
        },

        methods: {
            searchGoods: function () {
                this.bus.$emit('loading', true);
                api.queryGoodsWithWords(this.words).then(res => {
                    console.log(this.words)
                    if (res) {
                        this.bus.$emit('loading', false);
                        this.goodsList = res.data;
                        this.jqtable()
                    }
                })
            },


            //获取表格数据
            getJqtableData: function (newVal) {
                this.bus.$emit('loading', true);
                var data = "page=" + this.page + "&limit=" + this.limit + "&fatherId=" + this.fatherId;
                api.getCateGoodsList(data).then(res => {
                    this.bus.$emit('loading', false);
                    this.goodsList = res.page.list;
                    //加载表格数据
                    this.jqtable()
                    this.editGoodsId = null;

                });
            },


            // 初始化表格
            jqtable() {

                // 清空jqGrid表格数据
                $("#jqGridInventory").jqGrid("clearGridData")

                // 初始化jqgrid
                var _this = this

                //更新数据
                $("#jqGridInventory").jqGrid('setGridParam', {
                    datatype: 'local',
                    data: this.goodsList,//newData是符合格式要求的重新加载的数据
                    page: this.currPage//哪一页的值
                }).trigger("reloadGrid");

                $("#jqGridInventory").jqGrid('setLabel', '0', '序号', 'labelstyle');

                $("#jqGridInventory").jqGrid(
                    {
                        data: _this.goodsList,
                        datatype: "local",
                        colModel: [
                            {label: 'goodsId', name: 'nxGoodsId', width: 50, key: true, hidden: true},
                            {label: '产品名称', name: 'nxGoodsName', width: 120},
                            {label: '采购规格', name: 'nxGoodsStandardname', width: 80},
                            {label: '申请规格', name: 'nxGoodsPinyin', width: 80},
                            {label: '出货部门', name: 'outDepEntity.depName', width: 80},
                            {label: '采购部门', name: 'purDepEntity.depName', width: 80},
                            {label: '零售价格', name: 'price', width: 80},
                            {label: '拼音', name: 'pinyin', width: 120},
                            {label: '简拼', name: 'headPinyin', width: 80},

                            {
                                label: '库存', name: 'stockPurStandard', width: 110,
                                formatter: function (value, options, rowData) {
                                    return name = rowData.stockPurStandard + rowData.purStandardName
                                }
                            },

                        ],


                        viewrecords: true,
                        height: 400,
                        rowNum: 10,
                        rowList: [10, 30, 50],
                        rownumbers: true,
                        rownumWidth: 25,
                        shrinkToFit: false,
                        autowidth: true,
                        autoScroll: true,
                        multiselect: true,
                        pager: "#jqGridPagerInventory",
                        jsonReader: {
                            root: "page.list",
                            page: this.currPage,
                            total: this.totalCount,
                            records: this.totalPage,
                        },
                        prmNames: {
                            page: "page",
                            rows: "limit",
                            order: "order"
                        },
                        // gridComplete: function () {
                        //     //隐藏grid底部滚动条
                        //     $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "scroll"});
                        // }
                    });

            },


            //添加新商品
            add: function () {
                this.editGoodsId = "-1";
                $('#modal_inventory').show();
            },

            //更新商品
            update: function (event) {
                var goodsId = this.getSelectedRow();
                this.editGoodsId = goodsId;
                if (goodsId == null) {
                    return;
                }

                $('#modal_inventory').show();
                // $('#modal_inventory').attr('goodsid', goodsId);

            },


            del: function (event) {
                var goodsIds = this.getSelectedRows();
                if (goodsIds == null) {
                    return;
                }

                api.deleteGoods(goodsIds).then(res => {
                    if (res) {
                        this.getJqtableData();
                    }
                })
            },


            //选择一条记录
            getSelectedRow: function () {
                var grid = $("#jqGridInventory");
                var rowKey = grid.getGridParam("selrow");
                if (!rowKey) {
                    console.log("请选择一条记录a");
                    return;
                }

                var selectedIDs = grid.getGridParam("selarrrow");

                if (selectedIDs.length > 1) {

                    console.log("只能选择一条记录b");
                    return;
                }
                // var celldata = $("jqgridtableid").jqGrid('getCell',id,colnum);
                return selectedIDs[0];
            },


            //选择多条记录
            getSelectedRows: function () {
                var grid = $("#jqGridInventory");
                var rowKey = grid.getGridParam("selrow");
                if (!rowKey) {
                    alert("请选择一条记录");
                    return;
                }
                return grid.getGridParam("selarrrow");
            },

            //选中多条数据内容
            getSelectedRowsContents: function (param) {

                var ids = this.getSelectedRows();

                var grid = $("#jqGridInventory");
                var contents = [];

                for (var i = 0; i < ids.length; i++) {
                    var paramContent = grid.jqGrid('getRowData', ids[i])[param];
                    contents.push(paramContent);
                }
                return contents;
            },

            //商品类别-删除
            delOne: function () {
                if (this.goodsList.length == 0) {
                    api.deleteOne(this.fatherId).then(res => {
                        if (res.code == 0) {
                            // this.getCateGoods();
                        }
                    })
                }
            },


            getCateGoodsArr: function () {

                api.getCateGoods(this.secondFatherId).then(res => {

                    if (res) {
                        console.log(res.data)
                        if(res.data.length > 0){
                            this.fatherId = res.data[0].nxGoodsId;
                            this.goodsArr = res.data;
                            this.fatherName = res.data[0].nxGoodsName;
                            this.isactive = 0;
                            this.getJqtableData();

                        }else{
                            this.goodsArr = "";
                            this.goodsList = "";
                            $("#jqGridInventory").jqGrid("clearGridData")

                        }


                    }
                })
            },

            //点击产品类别
            onclickProducts(index, goodsId, goodsName) {
                this.isactive = index;
                this.fatherId = goodsId;
                this.fatherName = goodsName;
                this.getJqtableData();
            },


            addCate: function () {
                this.$router.push({name: 'addCategory', params: {secondFatherId: this.secondFatherId}})
            },

            updateCate: function(){
                this.$router.push({name: 'addCategory', params: {fatherId: this.fatherId}})
            },

            // importGoods: function () {
            //     this.$router.push('/importGoods')
            // },

            downloadGoods: function () {
                window.open("http://localhost:8080/nxl_war_exploded/api/nxgoods/downloadExcel")
            },
            importGoods: function () {
                this.$router.push('/importGoods')
            },

            downloadGoods: function () {
                window.open("http://localhost:8080/nxl_war_exploded/api/nxgoods/downloadExcel?fatherId=" + this.fatherId)
            }


        }
    }
</script>

<style scoped>

    .category {
        padding-left: 0;
    }

</style>
