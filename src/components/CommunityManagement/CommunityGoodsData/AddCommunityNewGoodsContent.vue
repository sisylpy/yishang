<template>


    <div class="content">
        <div class="row ">
            <div class="col-md-7">
                <div>
                    <input type="hidden" name="nxGoods.nxGoodsId" :value="nxGoods.nxGoodsId">
                </div>

                <div class="form-group ">
                    <label>商品图片</label>
                    <div style="width: 100%; height: 15rem; ">
                        <img style="height:100%;width:50%;" v-if="nxGoods.nxGoodsFile"
                             :src="server + nxGoods.nxGoodsFile" alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label>销售规格</label>
                    <div class="contentsisy" id="standardSelect"></div>
                </div>
            </div>

            <div class=" col-md-5">


                    <div class="form-group">
                        <!--<label>订单显示:</label>-->
                        <div class="form-group"
                             style="display: flex; flex-flow: row nowrap;  justify-content:flex-start;">

                            <label style="margin-right: 30px;">
                                <input type="radio" name="r4" class="flat-red" value="one">
                                供货商
                            </label>
                            <label style="margin-right: 30px;">
                                <input type="radio" name="r4" class="flat-red" value="two">
                                社区库存
                            </label>
                            <label style="margin-right: 30px;">
                                <input type="radio" name="r4" class="flat-red" value="three">
                                加工
                            </label>

                        </div>
                </div>

                <div class="form-group">
                    <label>选择供货商</label>
                    <select class="form-control select2" id="replaceCommunity" style="width: 100%;">
                        <option value=""></option>
                        <option v-for="(item) in supplierList" :value="item.nxDistributerSupplierId">
                            {{item.nxSupplierEntity.nxSupplierName}}
                        </option>
                    </select>
                </div>

                <div class="form-group">
                    <label>采购价(元/{{nxGoods.nxGoodsStandardname}})</label>
                    <input type="text" class="form-control" v-model="buyingPrice">
                </div>
                <div class="form-group">
                    <label v-if="buyingPrice > 0">销售价格 - ({{ (Number(buyingPrice) + (buyingPrice * 0.3)).toFixed(1)
                        }}元/{{nxGoods.nxGoodsStandardname}}) </label>
                    <label v-else>销售价格</label>
                    <input type="text" class="form-control" v-model="sellPrice">
                </div>

                <div class="form-group">
                    <div class="row">
                        <button type="button" class="btn btn-sm btn-default col-md-3" @click="close">关闭</button>
                        <button type="button" class="btn btn-sm btn-primary col-md-3" @click="saveOrUpdate">确定
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
    import api from '@/api/background/goods'
    import apiSupplier from '@/api/supplier/supplier'
    import apiCommunityGoods from '@/api/community/communityGoodsData'


    export default {
        name: "AddCommunityGoodsContent",

        data() {
            return {

                url: "",
                nxGoods: {},
                file: "",
                supplierList: [],
                page: 1,
                limit: 2000,
                server: "http://localhost:8080/nxl_war_exploded/",
                communityGoods: {},
                supplierId: "",
                standardArr: [],
                buyingPrice: "",
                sellPrice: "",
                communityStandardList: [],
                nxCgGoodsType: "1",
                // aaa: "1"

            }
        },
        props: {


            nxGoodsId: {
                type: Number,
                default: ''
            }

        },


        created() {
            if (this.nxGoodsId !== null) {
                this.getInfo();
            }

        },

        mounted() {

            var that = this;

            //初始化select选择框
            $('.select2').select2()
            //选择店铺
            $('#replaceCommunity').on('change', function () {

                that.supplierId = $(this).val();

            });


            this.getAllOutDep();


            $('input[type=radio].flat-red').eq(0).iCheck('check');

            $('input[type=radio][name=r4]').on('ifChecked', function (obj) {
                console.log("chanege")
                console.log($(this).val())
                if ($(this).val() == "one") {
                    console.log("shi img");
                    that.nxCgGoodsType = 1;
                    console.log(that.nxCgGoodsType)
                }
                if ($(this).val() == "two") {
                    console.log("shi paste");
                    that.nxCgGoodsType = 2;
                    console.log(that.nxCgGoodsType)

                }
                if ($(this).val() == "three") {
                    console.log("shi paste");
                    that.nxCgGoodsType = 3;
                    console.log(that.nxCgGoodsType)

                }

            })


        },


        methods: {
            close() {
                this.$emit('hidden')
            },

            getAllOutDep: function () {
                this.bus.$emit('loading', true);
                var data = "page=" + this.page + "&limit=" + this.limit + "&disId=" + 1;
                apiSupplier.getAll(data)
                    .then(res => {
                        this.bus.$emit('loading', false);
                        if (res) {
                            this.supplierList = res.page.list
                        }
                    })
            },


            getInfo: function () {
                api.getGoodsInfo(this.nxGoodsId).then(res => {
                    if (res) {
                        console.log(res.data);
                        this.nxGoods = res.data;
                        this.standardArr = res.data.nxGoodsStandardEntities;
                        for (let i = 0; i < res.data.nxGoodsStandardEntities.length; i++) {
                            var standard = res.data.nxGoodsStandardEntities[i];
                            var s = standard.nxStandardName;
                            var standardHtml = `<div class="prize-item">
    <div class="row" >
     ` + (i + 1) * 1 + `,
      <label style="margin-left: 0.2rem;">
         <input type="checkbox" class="flat-red" value=` + standard.nxStandardName + `>
         <input type="hidden" class="standard-file" value=` + standard.nxStandardFilePath + `>
 ` + s + `
      </label>
    </div>
         <div class="row">
            <div class="col-md-4" style="border: 1px solid lightgray;">
               <img style="width: 8rem; height: 8rem; "  src= http://localhost:8080/nxl_war_exploded/` + standard.nxStandardFilePath + ` >
            </div>
            <div class="col-md-8" >
            <div style="padding: 1rem 0;">
               称重: 1 ` + s + `= <input type="text" style="width: 50%;" class="standard-scale"> ` + this.nxGoods.nxGoodsStandardname + `
            </div>
           <div class=""> 误差: <input type="text" style="width: 50%" class="standard-error">` + this.nxGoods.nxGoodsStandardname + ` </div>
         </div>
        </div>
    </div>`;

                            $('#standardSelect').append(standardHtml)
                        }

                        //Flat red color scheme for iCheck
                        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                            checkboxClass: 'icheckbox_flat-green',
                            radioClass: 'iradio_flat-green'
                        });

                        //改变单列，双列，三列radio
                        $('input[type=checkbox].flat-red').on('ifChanged', function (obj) {
                            console.log($(this).val());   // 获取该复选框的value值
                            console.log(obj.currentTarget.checked)   // 获取该复选框当前状态是否选中
                            console.log('您更改了复选框的状态');
                            var which = $(this).val();
                            console.log(which);
                        });
                    }


                })
            },

            saveOrUpdate: function (event) {
                var standardArr = [];
                $('input:checkbox:checked').each(function (index, item) {
                    console.log("this.preent().sibling?????????")
                    console.log($(this).parent().parent().parent().siblings())
                    var scale = $(this).parent().parent().parent().siblings().find('.standard-scale').val();
                    var error = $(this).parent().parent().parent().siblings().find('.standard-error').val();
                    var path = $(this).parent().siblings('.standard-file').val();
                    var name = $(this).val();

                    var communityStandard = {
                        nxCsStandardName: name,
                        nxCsStandardFilePath: path,
                        nxCsStandardScale: scale,
                        nxCsStandardError: error,

                    };
                    standardArr.push(communityStandard);

                });

                var sellPrice = this.sellPrice;
                var price = "";
                var decimal = "";
                if (sellPrice.indexOf('.') !== -1) {
                    var str = sellPrice.split('.');
                    price = str[0];
                    decimal = str[1];
                } else {
                    price = this.sellPrice;
                    decimal = 0;
                }

                let type = "";
                if (standardArr.length > 0) {
                    type = 1;
                } else {
                    type = 0;
                }

                var communityGoods = {
                    nxCgDistributeId: 1,
                    nxCgNxGoodsId: this.nxGoods.nxGoodsId,
                    NxCgNxGoodsFatherId: this.nxGoods.nxGoodsFatherId,
                    nxCgNxGoodsFatherName: this.nxGoods.fatherGoods.nxGoodsName,
                    nxCgNxGoodsFilePath: this.nxGoods.nxGoodsFile,
                    nxCgGoodsPrice: price,
                    nxCgGoodsPriceDecimal: decimal,
                    nxCgGoodsSellType: type,
                    nxCgCommunityId: 1,
                    nxCgSupplierId: this.supplierId,
                    nxCommunityStandardEntities: standardArr,
                    nxCgBuyingPrice: this.buyingPrice,
                    NxCgNxGoodsFatherImg: this.nxGoods.fatherGoods.nxGoodsFile,
                    NxCgGrandFatherId: this.nxGoods.grandGoods.nxGoodsId,
                    NxCgGrandFatherName: this.nxGoods.grandGoods.nxGoodsName,
                    NxCgGreatGrandFatherId: this.nxGoods.greatGrandGoods.nxGoodsId,
                    NxCgGreatGrandFatherName: this.nxGoods.greatGrandGoods.nxGoodsName,
                    nxCgGoodsName: this.nxGoods.nxGoodsName,
                    nxCgGoodsType: this.nxCgGoodsType,
                    nxCgGoodsDetail: this.nxGoods.nxGoodsDetail,
                    nxCgGoodsStandardname: this.nxGoods.nxGoodsStandardname,
                    nxCgGoodsPinyin: this.nxGoods.nxGoodsPinyin,
                    nxCgGoodsPy: this.nxGoods.nxGoodsPy,

                };

                console.log("=============")
                console.log(communityGoods)

                apiCommunityGoods.postDgGoods(communityGoods)
                    .then(res => {
                        if (res.code == 0) {
                            console.log(communityGoods)

                            // this.$parent.$data.updateba = true;
                            // this.$emit('hidden')


                        }
                    })

            },


        }
    }
</script>


<style>

    .contentsisy {
        padding: 0 0 2rem 0;
        /*position: absolute;*/
        /*left: 0;*/
        /*bottom: 7px;*/
        width: 80%;
        /*height: 10rem;*/
        display: flex;
        overflow-x: auto;
        overflow-y: hidden;
    }

    .prize-item {
        flex-shrink: 0;
        margin-right: 10px;
        position: relative;
        display: inline-block;
        /*width: 10rem;*/
        /*height: 10rem;*/
        /*background-size: contain;*/
        /*background-repeat: no-repeat;*/
    }
</style>
