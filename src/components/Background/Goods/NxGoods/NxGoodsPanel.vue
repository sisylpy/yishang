<template>

    <div class="">

        <div class="box box-default no-padding">

            <div class="box-header with-border" style="background: #ededed; ">
                <h3 class="box-title">{{secondFatherName}}</h3>

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
                <div class="row">

                    <div class="col-lg-3 col-md-4 col-xs-12" v-for="(item,index) in goodsList" v-bind:key="item.id"  >
                        <!-- small box -->
                        <div class="flex-column" style="border: 1px solid lightgray; padding-bottom: 1rem; margin-bottom: 1rem;">
                            <div class="nxGoods"  v-bind:style="{backgroundImage:'url('+ server  + item.nxGoodsFile + ')'}" >
                            </div>
                            <div class="flex-row-between with-lr-padding with-tb-padding">
                               <div>商品:{{item.nxGoodsName}}</div>
                                <i class="glyphicon glyphicon-pencil"  @click="update(item.nxGoodsId)"></i>
                            </div>
                            <div class="flex-row with-lr-padding" style="font-size: 1.2rem;">
                                <div >规格:</div>
                                <div >{{item.nxGoodsStandardname}}</div>
                            </div>
                            <div class="flex-row-between with-lr-padding" style="font-size: 1rem; ">
                                <div class="flex-row" style="font-size: 1.2rem;">
                                    <div>销售规格:</div>
                                    <div>{{item.nxGoodsStandardAmount}}个</div>
                                    <div><i class="glyphicon glyphicon-th-list"></i>
                                    </div>
                                </div>
                                <div class="">
                                   <i class="fa  fa-plus-circle" @click='addStandard(item.nxGoodsId)'></i>
                                </div>

                            </div>

                        </div>


                    </div>


                </div>

            </div>

        </div>



    </div>
</template>

<script>
    import api from '../../../../api/background/goods'
    import importGoods from '@/components/Background/Goods/ImportGoods.vue'
    import AddGoods from '@/components/Background/Goods/NxGoods/AddNxGoods.vue'
    import AddNxStandard from '@/components/Background/Goods/NxGoods/AddNxStandard.vue'
    import AddCommunityGoods from '@/components/CommunityManagement/CommunityGoodsData/AddCommunityNewGoodsContent.vue'

    export default {
        name: "nxGoodsPanel",
        props: ['secondFatherId','secondFatherName'],

        components: {
            importGoods,
            AddGoods,
            AddCommunityGoods,
            AddNxStandard
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
                server: "http://localhost:8080/nxl_war_exploded/",
                addSuccess: "",
                layerTitle: "",

            }
        },
        watch: {
            addSuccess: function(newVal, oldVal){
              if(newVal == "ok"){
                  console.log("add ok l1")
                  this.getJqtableData();
                  this.editGoodsId = null;
                  this.addSuccess = null;

              }  else {
                  console.log("zai ganshennm?")
              }
            },
            $route() {
                console.log("rrrrrrr???????")
                this.firstGoodsId = this.$route.params.fatherId
            },
            secondFatherId: function (newVal, oldVal) {
                console.log("watch secondFatherId")
                if (newVal !== oldVal) {
                    console.log("!==")
                    this.secondFatherId = newVal;
                    this.getJqtableData(newVal)
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
                    }
                })
            },


            //获取表格数据
            getJqtableData: function (newVal) {
                this.bus.$emit('loading', true);
                var data = "page=" + this.page + "&limit=" + this.limit + "&fatherId=" + this.secondFatherId;
                api.getCateGoodsList(data).then(res => {
                    this.bus.$emit('loading', false);
                    this.goodsList = res.page.list;
                    this.editGoodsId = null

                });
            },


            openGoodsLayer:function(){
               this.$layer.iframe({
                    type: 4, //0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    title: this.layerTitle,
                    content: {
                        content: AddGoods,
                        parent: this,
                        data: {
                            fatherId: this.secondFatherId,
                            // fatherName: this.fatherName,
                            editGoodsId: this.editGoodsId,
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

            addStandard(data){
                console.log(data)
                this.$layer.iframe({
                    type: 4, //0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    title: this.layerTitle,
                    content: {
                        content: AddNxStandard,
                        parent: this,
                        data: {
                            nxGoodsId: data,
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

            //添加新商品
            add: function () {

                this.layerTitle = "新增"

                this.openGoodsLayer();

            },

            //更新商品
            update: function (event) {
                this.editGoodsId = event;
                this.layerTitle = "修改";
                this.openGoodsLayer();



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
                        if (res.data.length > 0) {
                            // this.fatherId = res.data[0].nxGoodsId;
                            this.goodsArr = res.data;
                            // this.fatherName = res.data[0].nxGoodsName;
                            this.isactive = 0;
                            this.getJqtableData();

                        } else {
                            this.goodsArr = "";
                            this.goodsList = "";
                            $("#jqGridInventory").jqGrid("clearGridData")
                        }
                    }
                })
            },


            addCate: function () {
                this.$router.push({name: 'addCategory', params: {secondFatherId: this.secondFatherId}})
            },

            updateCate: function () {
                this.$router.push({name: 'addCategory', params: {fatherId: this.fatherId}})
            },

            // importGoods: function () {
            //     this.$router.push('/importGoods')
            // },

            // downloadGoods: function () {
            //     window.open("http://localhost:8080/nxl_war_exploded/api/nxgoods/downloadExcel")
            // },
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
   .small-box .icon{
       font-size: 75px;
   }
    .icon{
        width: 50%;
        height: 50%;
        margin-top: 20px;
    }
    .nxGoods{
        height: 110px;
      background-position-x: center;
        background-position-y: center;
        background-size: 100% 100%;
    }
    .nxGoods-footer{
        position: absolute;
        bottom: 6rem;
        background: rgba(0,0,0, 0.3);
        /*width: 100%;*/
        line-height: 30px;
        text-align: center;
        color: #fff;
    }
    .footer-btn-group{
        display: flex;
        flex-flow: row nowrap;
        /*justify-content: flex-end;*/

    }

</style>
