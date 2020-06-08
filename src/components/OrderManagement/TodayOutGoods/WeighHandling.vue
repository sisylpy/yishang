<template>

    <div>


        <div id="weighHandlingGoods" class="row">

            <div class="col-md-3">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="my-sidebar">

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="my-sidebar-menu"
                        style="font-size: 16px; border: 1px solid lightgray; border-radius: 2px;">

                        <li class="my-treeview" v-for="(outDep,index) in outDepArr" style="padding: 5px; ">
                            <a style="line-height: 40px;color: #2b2b2b;">
                                {{outDep.dep}}
                            </a>
                            <ul class="my-treeview-menu" style="width: 90%;margin-left: 5%;color: #2b2b2b;;">
                                <li style="padding: 5px; width: 100%; "
                                    v-for="(item, itemIndex) in outDep.fathers"
                                    @click="getApplysStoreByFatherId(item.goodsId, index,itemIndex)">
                                    <a class="fatherGoods" style="line-height: 30px;color: #3f3f3f; "
                                       :style='index == 0 && itemIndex == 0 ? "color:red" : ""'>{{item.goodsName}}</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </section>
                <!-- /.sidebar -->


            </div>
            <div class="col-md-9" style="background: lightgray; padding-left: 20px; padding-right: 20px;">

                <div id="store_mode">
                    <div class="row" v-for="(item, index) in storeApplyArr" :key="">
                        <div style="display: flex;flex-flow: row nowrap; justify-content: space-between; align-items: center;margin-bottom: 10px;">
                            <h4 style="">{{item.store.storeName}}</h4>
                            <input type="number" placeholder="数量" name="handlingNumber">
                            <button class="btn-primary btn-sm" style="margin-right: 40px;"
                                    @click.stop="saveHandling(index)">保存
                            </button>

                        </div>
                        <div class="store-apply" style="padding: 0;width: 100%; ">
                            <div v-for="(outApply) in item.applys" :key="outApply.applyId" class="one-apply col-md-3"
                                 style="position: relative; padding: 0;display: flex;flex-flow: row nowrap; justify-items: flex-start;align-items: center;">
                                <input type="hidden" :id="outApply.applyId" class="apply-id">
                                <input type="hidden" :inStoreId="outApply.applyStoreId" class="store-id">
                                <input type="hidden" :goodsId="item.goodsId" class="goods-id">
                                <input type="hidden" :price="item.price" class="price">
                                <input type="hidden" :outdepid="outApply.outDepId" class="out-dep-id">
                                <div style="line-height: 30px;padding: 5px; float: left; ">
                                    {{outApply.ckGoodsEntity.goodsName}}
                                    {{outApply.applyNumber}}{{outApply.applyStandardName}}
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
    import api from '@/api/orderManagement/outGoods'

    export default {
        name: "WeighHandling",
        props: ['outType'],
        watch: {

            outType: function (newVal) {
                if (newVal == "weighHanding") {

                    this.getApplysAndSortsData();
                }
            }


        },
        data() {
            return {
                page: 1,
                limit: 20,
                outDepArr: [],
                fatherId: "",
                fatherIndex: "0",
                fatherPrice: 0,
                itemIndex: "0",
                storeApplyArr: []


            }
        },


        mounted() {
            var that = this;


            $('#weighHandlingGoods').on('keyup', '.outQuantity', function (e) {
                //获取当前输入框

                if (e.keyCode == 13) {
                    if ($(this).parent().next().children().length > 0) {
                        $(this).parent().next().children('.outQuantity').focus();

                    } else {
                        $(this).parents('tr').next().find('.store-apply').children(":first").children("input").focus();
                    }

                }
                if (e.keyCode == 40) {
                    if ($(this).parent().next().children().length > 0) {
                        $(this).parent().next().children('.outQuantity').focus();

                    } else {
                        $(this).parents('tr').next().find('.store-apply').children(":first").children("input").focus();

                    }
                }
            });

            $('#weighHandlingGoods').children().find('.my-sidebar-menu').addClass('open-view')


        },

        methods: {

            // 获取select分店和商品大类的新申请
            getApplysAndSortsData: function () {
                api.initWeightData(1).then(res => {
                    if (res.data) {
                        console.log(res.data)
                        this.outDepArr = res.data.fatherList;
                        this.storeApplyArr = res.data.applys;
                        this.fatherId = res.data['fatherList'][0]['fathers']['0']['goodsId'];
                        this.fatherPrice = res.data['fatherList'][0]['fathers']['0']['price'];
                    } else {
                        this.outDepArr = [];
                        this.storeApplyArr = [];
                        this.fatherId = "";
                        this.fatherPrice = "";
                    }
                })
            },

            getApplysStoreByFatherId: function () {
                api.getWeighApplyForStore(this.fatherId).then(res => {
                    if (res) {
                        console.log("ennene ")
                        console.log(res)
                        this.storeApplyArr = res.data
                    }
                })
            },

            saveHandling(index) {
                var applyArr = [];
                var apply = $('.store-apply').eq(index);
                console.log(index)
                console.log("index ==== ")

                var $applyIds = $('.store-apply').eq(index).find('.apply-id')
                console.log($applyIds)
                console.log($applyIds.length)

                console.log("<<<<<<<<<<<<<<<<<<<<<<<<<<,")
                var quantity = $('input[name="handlingNumber"]:eq(' + index + ')').val();
                console.log(quantity)
                console.log(this.fatherPrice)
                var subTotal = (Number(quantity) * Number(this.fatherPrice)).toFixed(1);
                console.log(subTotal)
                var outDepId = $('.store-apply').eq(index).find('.out-dep-id:eq(0)').attr('outdepid');
                var instoreid = $('.store-apply').eq(index).find('.store-id:eq(0)').attr('instoreid');


                if (quantity) {
                    console.log(quantity)
                    for (var i = 0; i < $applyIds.length; i++) {

                        var applya = {
                            applyId: $($applyIds[i]).attr("id")
                        }
                        applyArr.push(applya);
                    }

                    var handlingStock = {
                        stApplyId: -1,
                        quantity: quantity,
                        stGoodsId: this.fatherId,
                        inStoreId: instoreid,
                        discountPrice: this.fatherPrice,
                        outDepId: outDepId,
                        subTotal: subTotal,
                        ckApplysEntityList: applyArr
                    };


                    this.bus.$emit('loading', true);

                    api.saveOutQuantityHandling(handlingStock).then(res => {
                        if (res) {
                            this.bus.$emit('loading', false);

                            $('.outQuantity').val("");

                            if ($(apply).parent().siblings().length > 0) {
                                this.getApplysStoreByFatherId(this.fatherId);
                            } else {
                                this.getApplysAndSortsData();
                            }
                        }
                    })

                }

            },


        }


    }

</script>

<style scoped>
    .dropdown-menu {
        display: flex;
        flex-flow: column nowrap;

    }

    .dropdown-menu li {
        line-height: 30px;

    }

    .my-treeview > a .active {
        color: red;
    }

</style>
