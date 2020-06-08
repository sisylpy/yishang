<template>

    <div >
        <div class="box box-default no-padding" >

            <div class="box-header with-border" style="background: #ededed; ">
                <h3 class="box-title">{{secondFatherName}}</h3>
            </div>


            <div class="box-body no-padding">
                <div class="row">

                    <div class="col-lg-4 col-xs-12  margin-bottom "  v-for="(item,index) in goodsList" v-bind:key="item.id">
                        <!--v-bind:style="{backgroundImage:'url('+ server  + item.nxGoodsFile + ')'}"-->
                        <div class="flex-column" style="border: 0.1rem solid lightgray;">
                            <img  style="border-bottom: 0.1rem solid lightgray;" :src="server + item.nxGoodsFile" class="goods-img">
                            <div class="flex-row-between with-lr-padding" >
                                <div style="line-height: 3rem; ">{{item.nxGoodsName}}</div>
                                <a class="">
                                    <i class="fa fa-plus" v-if="item.isDownload === 0"
                                       @click="download(item.nxGoodsId, item.nxGoodsName, item.nxGoodsStandardname)"></i>
                                    <i v-else class="fa fa-check-square"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <AddCommunityNewGoods ref="myConfirm"/>

    </div>
</template>

<script>
    import api from '@/api/background/goods'
    import apiComm from '@/api/community/communityGoodsData'
    import importGoods from '@/components/Background/Goods/ImportGoods.vue'
    import apiSupplier from '@/api/supplier/supplier'
    import AddCommunityNewGoods from '@/components/CommunityManagement/CommunityGoodsData/AddCommunityNewGoods.vue'


    export default {
        name: "communityTreeGoodsPanel",
        props: ['secondFatherId', 'secondFatherName', 'nxCommunityId', 'businessType'],

        components: {
            importGoods,
            AddCommunityNewGoods,

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
                nxGoodsId: null,
                fatherArr: [],
                words: "",
                server: "http://localhost:8080/nxl_war_exploded/",
                addSuccess: "",
                layerTitle: "",
                communityGoodsSupplierId: "",
                communityList: [],
                letUpdate: false,


                //
            }
        },
        watch: {
            //
            letUpdate: function(newVal, oldVal){
              if(newVal !== oldVal){
                  console.log("let me update!!!!!")
                  this.getJqtableData();
              }
            },
            addSuccess: function (newVal, oldVal) {
                if (newVal === "ok") {
                    console.log("add ok l1")
                    // this.getJqtableData();
                } else {
                    console.log("zai ganshennm?")
                }
            },
            $route() {
                console.log("rrrrrrr???????")
                this.firstGoodsId = this.$route.params.fatherId
            },

            businessType: function (newVal) {
                if (newVal == "addCommunityGoods") {
                    this.businessType = "addCommunityGoods"
                }
            },
            secondFatherId: function (newVal, oldVal) {
                console.log("watch secondFatherId")
                if (newVal !== oldVal && this.businessType == "addCommunityGoods") {
                    console.log("!==222")
                    this.secondFatherId = newVal;
                    // this.getCateGoodsArr(newVal)
                    this.getJqtableData();

                }
            },
            nxCommunityId: function (newVal, oldVal) {
                console.log("watch nxCommunityId - items")
                if (newVal !== oldVal && this.businessType == "addCommunityGoods" ) {
                    this.nxCommunityId = newVal;
                    // this.getCateGoodsArr(newVal)
                    if(this.secondFatherId !== null){
                        this.getJqtableData();
                    }

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

                var data = "page=" + this.page + "&limit=" + this.limit + "&fatherId="
                    + this.secondFatherId + "&communityId=" + this.nxCommunityId;
                apiComm.getAddCommunityGoods(data).then(res => {
                    this.bus.$emit('loading', false);
                    this.goodsList = res.page.list;
                    console.log(res.page.list)
                    this.editGoodsId = null

                });
            },




            //更新商品
            download: function (id, name, standard) {
                console.log("downLoad click finishd!!!fkalfdas;lf")
                this.$refs.myConfirm.show("nihao", {
                    nxGoodsId: id,
                    titleText: name,
                    standard: standard
                })


            },


            getCateGoodsArr: function () {

                api.getCateGoods(this.secondFatherId).then(res => {

                    if (res) {
                        console.log(res.data)
                        if (res.data.length > 0) {
                            this.fatherId = res.data[0].nxGoodsId;
                            this.goodsArr = res.data;
                            this.fatherName = res.data[0].nxGoodsName;
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

            //点击产品类别
            onclickProducts(index, goodsId, goodsName) {
                this.isactive = index;
                this.fatherId = goodsId;
                this.fatherName = goodsName;
                this.getJqtableData();
            },


            getAllOutDep: function () {
                console.log("new getAlloutdep")
                this.bus.$emit('loading', true);

                var data = "page=" + this.page + "&limit=" + this.limit;
                console.log(this.page)
                console.log(data)

                apiSupplier.getAll(data)
                    .then(res => {
                        this.bus.$emit('loading', false);
                        if (res) {
                            console.log(res)
                            this.communityList = res.page.list
                            $('.select2').select2();

                        }
                    })
            },

            close: function () {
                this.nxGoods = {};
                this.$parent.$data.nxGoodsId = null;

                this.$layer.close(this.layerid);

            },


            getInfo: function () {
                console.log("getInfo????")
                api.getGoodsInfo(this.lydata.nxGoodsId).then(res => {
                    console.log(res.data)
                    this.nxGoods = res.data;

                })
            },

            saveOrUpdate: function (event) {
                let nxGoodsName = this.nxGoods.nxGoodsName;
                let nxGoodsStandardName = this.nxGoods.nxGoodsStandardname;
                let nxGoodsFatherId = this.fatherId;
                let nxGoodsId = "-1";
                console.log(nxGoodsName)

                let form = new FormData();
                form.append('file', this.file);
                form.append('nxGoodsName', nxGoodsName);
                form.append('nxGoodsStandardName', nxGoodsStandardName);
                form.append('nxGoodsId', nxGoodsId);
                form.append('nxGoodsFatherId', nxGoodsFatherId);

                if (this.nxGoods.nxGoodsId) {
                    api.updateGoods(form).then(res => {
                        // this.goodsId = null;
                        // this.nxGoods = {};
                        this.nxGoods = null;
                    })
                } else {
                    console.log("save")
                    api.saveGoods(form).then(res => {
                        if (res.code == 0) {
                            this.nxGoods = null
                            this.$parent.$data.addSuccess = "ok";
                            this.$layer.close(this.layerid);


                        }
                    })
                }
            },


        }
    }
</script>

<style scoped>

   .goods-img{
       width: 100%;
       height: 10rem;
   }


</style>
