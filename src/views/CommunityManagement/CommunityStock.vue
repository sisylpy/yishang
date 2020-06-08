<template>
    <div class="">

        <PageHeader/>

        <section>
            <div class="row">

                <div class="col-md-2">

                    <div class="box" style="max-height: 450px; overflow-y: auto;">

                        <div class="box-header with-border">
                            <h4 class="box-title">1社区: {{communityList.length}}家</h4>
                        </div>

                        <div class="box-body no-padding" >
                            <ul class="nav nav-pills nav-stacked" style="padding-bottom: 20px;">
                                <!--<li class="active"><a>Inbox</a></li>-->
                                <li v-for="(item,index) in communityList" v-bind:key="item.nxCommunityId" :id="item.nxCommunityId"
                                    :class="isactive == index ? 'active' : '' "
                                    @click='onclick(index, item.nxCommunityId,item.nxCommunityName)'>

                                    <a>{{item.nxCommunityName}}</a></li>
                            </ul>
                        </div>
                        <!-- /.box-body -->
                    </div>

                </div>

                <div class="col-md-10">

                    <div class="box box-primary">

                        <div class="box-header with-border">
                            <h3 class="box-title">{{nxCommunityName}}</h3>
                        </div>


                        <div class="content">
                            <div class="nav-tabs-justified">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#productsStock" data-toggle="tab" @click="changeStockPanel('stockGoods')">商品</a></li>
                                    <li><a href="#inStock" data-toggle="tab"  @click="changeStockPanel('inStock')">商品入库</a></li>
                                    <li><a href="#inDepBill" data-toggle="tab"  @click="changeStockPanel('inDepBill')">入库单据</a></li>
                                    <li><a href="#stockCount" data-toggle="tab"  @click="changeStockPanel('stockCount')">盘库</a></li>
                                </ul>
                                <div class="tab-content">

                                    <div class="active tab-pane" id="productsStock">
                                        <StockListPanel :stockType="stockType" :nxCommunityId="nxCommunityId"/>
                                    </div>
                                    <!-- /.tab-pane -->

                                    <div class="tab-pane" id="inStock">
                                        <NewBillPanel :stockType="stockType" :nxCommunityId="nxCommunityId"/>
                                    </div>

                                    <div class="tab-pane" id="inDepBill">

                                        <InDepBillPanel />
                                    </div>



                                    <div class="tab-pane" id="stockCount">
                                        stockCount
                                    </div>


                                </div>
                                <!-- /.tab-pane -->


                            </div>

                        </div>




                    </div>

                </div>


            </div>
        </section>



    </div>


</template>

<script>
    import PageHeader from '@/components/PageHeader.vue'
    import api from '@/api/community/communityGoodsData'

    import InDepBillPanel from '@/components/CommunityManagement/CommunityStock/InDepBillPanel'
    import NewBillPanel from '@/components/CommunityManagement/CommunityStock/NewBillPanel'
    import StockListPanel from '@/components/CommunityManagement/CommunityStock/StockListPanel'

    export default {
        name: "CommunityInventory",
        components: {
            PageHeader,
            NewBillPanel,
            StockListPanel,
            InDepBillPanel,
        },

        mounted() {


            api.getCommunityListAll(1).then(res => {
                if (res) {
                    console.log(res.data)
                    this.communityList = res.data;
                    this.nxCommunityId = res.data[0].nxCommunityId;
                    this.nxCommunityName = res.data[0].nxCommunityName;
                }
            })
        },
        data(){
            return{
                stockType: "stockGoods",
                communityList: [],
                isactive: 0,
                storeId: "",
                storeName: "",
                businessType: "promote",
                nxCommunityId: null,
                nxCommunityName: "",
                disId: 1

            }
    },

        methods: {
            //点击产品类别
            onclick(index, nxCommunityId, nxCommunityName) {
                this.isactive = index;
                this.nxCommunityId = nxCommunityId;
                this.nxCommunityName = nxCommunityName;
            },

            //点击出货部门的三大业务
            changeStockPanel: function (data,) {
                if (data === "stockGoods") {
                    this.stockType = data;
                } else if (data === "inStock") {
                    this.stockType = data;
                } else if (data === "stockBill") {
                    this.stockType = data;
                } else if (data === "stockCount") {
                    this.stockType = data;
                }
            },


        }
    }
</script>

<style scoped>
    .content {
        padding-left: 0;
    }

</style>

