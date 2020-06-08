<template>

    <div class="my_panel" style="min-height: 40rem;">

        <div class="panel panel-default">

            <div class="panel-heading">

                <div class="panel-title">

                    <div class="pull-left">

                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                选择产品类别
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a @click="getCataGoodsData(0)">全部商品</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a @click="getCataGoodsData(item.nxCommunityFatherGoodsId)" v-for="(item, index) in cataArr">{{item.nxFatherGoodsName}}</a></li>
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

                <table id="dailyTable"></table>
                <div id="dailyPager"></div>
            </div>

        </div>

        <CommunityGoodsAddPromote  ref="addPromote"/>

    </div>




</template>

<script>
    import apiComm from '@/api/community/communityGoodsData'
    import CommunityGoodsAddPromote from '@/components/CommunityManagement/CommunityGoodsData/CommunityGoodsAddPromote.vue'

    export default {
        name: "CommunityGoodsPanel",
        props: ['nxCommunityId','businessType' ],
        components: {
            CommunityGoodsAddPromote,

        },
        watch: {
            nxCommunityId: function (newVal) {
                this.nxCommunityId = newVal;
                if (this.businessType == "communityGoods") {
                    console.log("wathed nxCommunityId")
                    this.nxCommunityId = newVal;
                    this.getCommunityCataData();

                }

            },
            businessType: function (newVal) {
                if (newVal == "communityGoods") {
                    console.log("wathed businessType111")
                    this.getCommunityCataData();
                }
            }
        },
        mounted() {

            var that = this;
            $("#dailyTable").on('click','.proBtn', function (e) {
                that.nxCgGoodsId = $(this).attr('id');
                // that.originalPrice   = $(this).parent().prev().text();
                // that.nxCgGoodsName = $(this).parent().siblings("td:eq(3)").text();
                // console.log(that.nxGoodsName)

                that.addPromotionGoodsLayer();

            })


        },
        data() {
            return {
                page: 1,
                limit: 100,
                cataArr: [],
                goodsList: [],
                tableName: "没有数据，请刷新页面",
                words: "",
                addSuccess: "",
                originalPrice: "",
                nxCgGoodsId: "",
                nxCgGoodsName: "",


            }
        },
        methods: {



            getCommunityCataData(){
              apiComm.getCommunityCataData(this.nxCommunityId).then(res => {
                  if(res){
                      this.cataArr = res.data;
                      this.goodsList = null;
                      $("#dailyTable").jqGrid("clearGridData")

                  }


              })

            },

            //获取表格数据
            getCataGoodsData: function(id){
                var data = "page=" + this.page + "&limit=" + this.limit + "&nxCommunityFatherGoodsId=" + id;
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
                $("#dailyTable").jqGrid("clearGridData")

                // 初始化jqgrid
                var _this = this

                //更新数据
                $("#dailyTable").jqGrid('setGridParam',{
                    datatype:'local',
                    data:this.goodsList,//newData是符合格式要求的重新加载的数据
                    page:this.currPage//哪一页的值
                }).trigger("reloadGrid");

                $("#dailyTable").jqGrid('setLabel', '0', '序号', 'labelstyle');

                $("#dailyTable").jqGrid(
                    {
                        data: _this.goodsList,
                        datatype: "local",
                        colModel: [
                            {label: 'goodsId', name: 'nxGoodsId', width: 50, key: true, hidden: true},
                            {label: '产品名称', name: 'nxCgGoodsName', class:'goodsname' ,width: 120},
                            {label: '规格', name: 'nxCgGoodsStandardname', width: 100},
                            {label: '供货商', name: 'nxSupplierEntity.nxSupplierName', width: 150},
                            {label: '进货价', name: 'nxCgBuyingPrice', width: 100},
                            {label: '出售价', name: 'nxCgOutPrice', width: 100, formatter: function (cell, grid, rows) {
                                var price = rows.nxCgGoodsPrice + "." +rows.nxCgGoodsPriceDecimal
                                    return name = price
                                }},
                            { label: '操作', name: 'nxCgGoodsStatus', index:'nxCgGoodsStatus', width: 150, edittype:"button", formatter: function (cellValue, grid, rows, state) {
                                    if(!cellValue == 3){
                                        return "<input type='button'  value='添加活动' id= "+rows.nxCommunityGoodsId +"  class='btn btn-primary proBtn' />" ; }
                                    else {
                                        return "<input type='button'  value='促销中' id="+ rows.nxCommunityGoodsId+" class='btn btn-warning proBtn' />";}
                                    },
                                },
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
                        pager: "#dailyPager",
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


            addPromotionGoodsLayer:function(){

                this.$refs.addPromote.show("nihao", {
                    nxCgGoodsId: this.nxCgGoodsId,
                    // nxCgGoodsName: this.nxCgGoodsName,
                    // nxCommunityId: this.nxCommunityId,
                    // originalPrice: this.originalPrice,
                })


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
