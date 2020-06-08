<template>

    <div class="my_panel" style="min-height: 40rem;">





        <div class="panel panel-default">

            <div class="panel-heading">

                <div class="panel-title">

                    <div class="pull-left">

                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                ddd
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a @click="getCataGoodsData(0)">全部商品</a></li>
                                <li role="separator" class="divider"></li>
                                <!--<li><a @click="getCataGoodsData(item.nxCommunityFatherGoodsId)" v-for="(item, index) in cataArr">{{item.nxCfgGoodsFatherName}}</a></li>-->
                            </ul>
                        </div>
                    </div>

                    <div class="pull-right">
                        <div class="box-tools">


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

                </div>


            </div>

            <div class="panel-body" >

                <table id="ofSupplierGoodsTable"></table>
                <div id="ofSupplierGoodsPager"></div>
            </div>

        </div>


    </div>




</template>

<script>
    import apiOutGoods from '@/api/outGoods/outGoods'
    import EditSupplierGoods from '@/components/Supplier/SupplierList/EditSupplierGoods.vue'

    export default {
        name: "OfSupplierPanel",
        props: ['nxSupplierId', 'nxSupplierName' ],

        components: {
            EditSupplierGoods,

        },
        watch: {
            nxSupplierId: function (newVal) {
                this.nxSupplierId = newVal;
                // if (this.businessType == "communityGoods") {
                //     console.log("wathed nxCommunityId")
                //     this.getCommunityCataData();
                //
                // }
                this.getSupplierGoodsData();

            },
            addSuccess : function (newVal) {
                if(newVal == "ok"){
                    this.getSupplierGoodsData()
                }
            }

        },
        mounted() {

            var that = this;
            $("#ofSupplierGoodsTable").on('click','.editBtn', function (e) {
                that.nxCommunityGoodsId = $(this).attr('id');
                //
                that.addSupplierGoodsLayer();

            })
            if(!this.nxSupplerId == null){
                this.getSupplierGoodsData();

            }



        },
        data() {
            return {
                page: 1,
                limit: 20,
                goodsList: [],
                tableName: "没有数据，请刷新页面",
                words: "",
                addSuccess: "",
                nxCommunityGoodsId: "",
                goodsImg: "",



            }
        },
        methods: {



            getSupplierGoodsData(){
                var data = "page=" + this.page + "&limit=" + this.limit + "&goodsType=1&nxSupplierId=" + this.nxSupplierId;

                apiOutGoods.getOutGoodsOfGoodsType(data).then(res => {
                  if(res){
                      console.log(res.page)
                      this.goodsList = res.page.list;
                      this.jqtable()

                  }


              })

            },

            //获取表格数据
            getCataGoodsData: function(newVal){
                var data = "page=" + this.page + "&limit=" + this.limit + "&nxCommunityFatherGoodsId=" + newVal;
                console.log(data)
                apiComm.getCommunityGoods(data).then(res => {
                    console.log(res)
                    this.goodsList = res.page.list;
                    //加载表格数据
                    this.jqtable()
                });

            },


            // 初始化表格
            jqtable() {

                console.log("jqtable?????")

                // 清空jqGrid表格数据
                $("#ofSupplierGoodsTable").jqGrid("clearGridData")

                // 初始化jqgrid
                var _this = this

                //更新数据
                $("#ofSupplierGoodsTable").jqGrid('setGridParam',{
                    datatype:'local',
                    data:this.goodsList,//newData是符合格式要求的重新加载的数据
                    page:this.currPage//哪一页的值
                }).trigger("reloadGrid");

                $("#ofSupplierGoodsTable").jqGrid('setLabel', '0', '序号', 'labelstyle');

                $("#ofSupplierGoodsTable").jqGrid(
                    {
                        data: _this.goodsList,
                        datatype: "local",
                        colModel: [
                            {label: 'goodsId', name: 'nxCommunityGoodsId', width: 50, key: true, hidden: true},
                            // {label: '社区', name: 'nxCommunityEntity.nxCommunityName', width: 80},
                            {label: '产品名称', name: 'nxCommunityGoodsEntity.nxCgGoodsName', width: 120},
                            {label: '社区', name: 'nxCommunityEntity.nxCommunityName', width: 80},
                            // {label: '进货价', name: 'nxCgBuyingPrice', width: 100},
                            // {label: '出售价', name: 'nxCgBuyingPrice', width: 100, formatter: function (cell, grid, rows) {
                            //     var price = rows.nxCgGoodsPrice + "." +rows.nxCgGoodsPriceDecimal
                            //         return name = price
                            //     }},
                            // {label: '图片', name: 'nxCgGoodsFilePath', width: 100, edittype:"img", formatter: function (cellValue, grid, rows) {
                            //        if(cellValue !== null){
                            //            return "<img src='http://localhost:8080/nxl_war_exploded/"+ cellValue +"' style='width:70px; height: 40px;' class='goods-img' />"
                            //        }else{
                            //            return "<img  style='width:70px; height: 40px;' class='goods-img' />"
                            //
                            //        }
                            //     }},
                            // { label: '操作', name: 'nxCommunityGoodsId',  width: 80, edittype:"button", formatter: function (cellValue, grid, rows, state) {
                            //             return "<input type='button'   value='修改进货价格' id= "+rows.nxCommunityGoodsId +"  class='btn btn-primary editBtn' />" ; },
                            // },
                            // { label: '操作', name: 'nxCgGoodsStatus', index:'nxCgGoodsStatus', width: 150, edittype:"button", formatter: function (cellValue, grid, rows, state) {
                            //         if(!cellValue == 3){
                            //             return "<input type='button'  value='添加活动' id= "+rows.nxCommunityGoodsId +"  class='btn btn-primary proBtn' />" ; }
                            //         else {
                            //             return "<input type='button'  value='促销中' id="+ rows.nxCommunityGoodsId+" class='btn btn-warning proBtn' />";}
                            //         },
                            //     },
                        ],
                        viewrecords: true,
                        height: 400,
                        rowNum: 10,
                        rowList: [10, 30, 50],
                        rownumbers: true,
                        rownumWidth: 25,
                        shrinkToFit:false,
                        autowidth: true,
                        autoScroll: true,
                        multiselect: true,
                        pager: "#ofSupplierGoodsPager",
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

            searchGoods() {

            },
            change(e){
                console.log(e)

            },


            addSupplierGoodsLayer:function(){
                this.$layer.iframe({
                    type: 4, //0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    title: this.layerTitle,
                    content: {
                        content: EditSupplierGoods,
                        parent: this,
                        data: {
                            nxCommunityGoodsId: this.nxCommunityGoodsId,
                        }

                    },
                    area: 'auto',
                    offset: 'auto',
                    icon: -1,
                    btn: '确定1',
                    time: 0,
                    shade: true,//是否显示遮罩
                    cancel: '',
                    tips: [0,{}],//支持上右下左四个方向，通过1-4进行方向设定,可以设定tips: [1, '#c00']
                    tipsMore: false,//是否允许多个tips
                    shadeClose: true,//点击遮罩是否关闭
                    maxmin: false,//开启最大化最小化
                    scrollbar: true, //是否允许浏览器出现滚动条:默认是允许
                    resize: false, //是否允许拉伸，默认是不允许
                    yes: '',

                });
            },
        },



    }

</script>

<style scoped>
    /*.content{*/
    /*background: #fff;*/
    /*}*/


    .panel-title {
        height: 40px;
    }




</style>
