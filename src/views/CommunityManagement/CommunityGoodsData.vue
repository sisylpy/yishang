<template>
    <div class="">

        <PageHeader/>

        <!--<section class="content">-->
        <section>
            <div class="row">

                <div class="col-md-2">

                    <div class="box" style="max-height: 450px; overflow-y: auto;">

                        <div class="box-header with-border">
                            <h4 class="box-title">社区: {{communityList.length}}家</h4>
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

                        <div class="box-body">
                            <div class="nav-tabs-justified">
                                <ul class="nav nav-tabs">
                                    <!--<li class="active"><a href="#customer" data-toggle="tab" @click="changeCommunityType('customer')">客户</a></li>-->
                                    <li class="active"><a href="#promote" data-toggle="tab" @click="changeCommunityType('promote')">促销活动</a></li>
                                    <li><a href="#adsense" data-toggle="tab" @click="changeCommunityType('adsense')">广告位</a></li>
                                    <li><a href="#communityGoods" data-toggle="tab" @click="changeCommunityType('communityGoods')">出售商品</a></li>
                                    <li><a href="#addCommunityGoods" data-toggle="tab" @click="changeCommunityType('addCommunityGoods')">增添新商品</a></li>
                                </ul>
                                <div class="tab-content">


                                    <!--<div class="tab-pane active" id="customer">-->
                                        <!--<Customer :nxCommunityId="nxCommunityId" :nxCommunityName="nxCommunityName" :businessType="businessType"/>-->
                                    <!--</div>-->

                                    <div class="tab-pane active" id="promote">
                                        <PromotePanel :nxCommunityId="nxCommunityId" :nxCommunityName="nxCommunityName" :businessType="businessType"/>
                                    </div>

                                    <div class="tab-pane" id="adsense">
                                        <AdsensePanel :nxCommunityId="nxCommunityId" :nxCommunityName="nxCommunityName" :businessType="businessType"/>
                                    </div>

                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="communityGoods">
                                        <CommunityGoodsPanel :nxCommunityId="nxCommunityId" :nxCommunityName="nxCommunityName" :businessType="businessType"/>
                                    </div>

                                    <div class="tab-pane" id="addCommunityGoods">
                                        <AddCommunityGoodsPanel :nxCommunityId="nxCommunityId" :nxCommunityName="nxCommunityName" :businessType="businessType"/>
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

    import CommunityGoodsPanel from '@/components/CommunityManagement/CommunityGoodsData/CommunityGoodsPanel'
    import TurnoverPanel from '@/components/CommunityManagement/CommunityGoodsData/TurnoverPanel'
    import Customer from '@/components/CommunityManagement/CommunityGoodsData/Customer.vue'
    import AddCommunityGoodsPanel from '@/components/CommunityManagement/CommunityGoodsData/AddCommunityGoodsPanel.vue'
    import PromotePanel from '@/components/CommunityManagement/CommunityGoodsData/PromotePanel.vue'
    import AdsensePanel from '@/components/CommunityManagement/CommunityGoodsData/AdsensePanel.vue'

    export default {
        name: "CommunityBusinessData",

        data() {
            return {
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

        components: {
            PageHeader,
            CommunityGoodsPanel,
            TurnoverPanel,
            Customer,
            AddCommunityGoodsPanel,
            PromotePanel,
            AdsensePanel,

        },
        methods: {

            //点击产品类别
            onclick(index, nxCommunityId, nxCommunityName) {
                this.isactive = index;
                this.nxCommunityId = nxCommunityId;
                this.nxCommunityName = nxCommunityName;
            },


            //点击出货部门的三大业务
            changeCommunityType: function (data) {
                if (data === "promote") {
                    this.businessType = "promote"
                } else if (data === "adsense") {
                    this.businessType = "adsense"
                }
                else if (data === "communityGoods") {
                    this.businessType = "communityGoods"
                    console.log(this.businessType)
                } else if (data === "addCommunityGoods") {
                    this.businessType = "addCommunityGoods"
                }

            },

        }
    }
</script>

<style scoped>
    /*.nav-stacked>li.active>a{*/
    /*border-left-color: lightgray*/
    /*}*/

</style>

