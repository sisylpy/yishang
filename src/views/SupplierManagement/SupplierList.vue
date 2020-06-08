<template>
    <div class="">

        <PageHeader/>

        <!--<section class="content">-->
        <section>
            <div class="row">

                <div class="col-md-2">

                    <div class="box" style="max-height: 450px; overflow-y: auto;">

                        <div class="box-header with-border">
                            <h4 class="box-title">供货商: {{communityList.length}}家</h4>
                        </div>

                        <div class="box-body no-padding">
                            <ul class="nav nav-pills nav-stacked" style="padding-bottom: 20px;">
                                <!--<li class="active"><a>Inbox</a></li>-->
                                <li v-for="(item,index) in communityList" v-bind:key="item.nxDistributerSupplierId"
                                    :id="item.nxDistributerSupplierId"
                                    :class="isactive == index ? 'active' : '' "
                                    @click='onclick(index, item.nxDistributerSupplierId,item.nxSupplierEntity.nxSupplierName)'>
                                    <a>{{item.nxSupplierEntity.nxSupplierName}}</a></li>
                            </ul>
                        </div>
                        <!-- /.box-body -->
                    </div>

                </div>

                <div class="col-md-10">

                    <div class="box box-primary">

                        <div class="box-header with-border">
                            <h3 class="box-title">{{nxSupplierName}}</h3>
                        </div>

                        <div class="box-body">
                            <SupplierGoodsPanel :nxSupplierId ="nxSupplierId" :nxSupplierName="nxSupplierName"/>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


</template>

<script>
    import PageHeader from '@/components/PageHeader.vue'
    import api from '@/api/supplier/supplier'
    import SupplierGoodsPanel from '@/components/Supplier/SupplierList/SupplierGoodsPanel'

    export default {
        name: "SupplierList",

        data() {
            return {
                communityList: [],
                page: 1,
                limit: 20,
                disId: 1,
                tableName: "没有数据，请刷新页面",
                nxSupplierName: "",
                nxSupplierId: null,
                isactive: 0,


            }
        },

        mounted() {


            this.getAll();

        },

        components: {
            PageHeader,
            SupplierGoodsPanel,


        },
        methods: {

            //点击产品类别
            onclick(index, nxCommunityId, nxCommunityName) {
                this.isactive = index;
                this.nxSupplierId = nxCommunityId;
                this.nxSupplierName = nxCommunityName;
            },


            //点击出货部门的三大业务
            changeCommunityType: function (data) {
                if (data === "promote") {
                    this.businessType = "promote"
                } else if (data === "adsense") {
                    this.businessType = "adsense"
                } else if (data === "communityGoods") {
                    this.businessType = "communityGoods"
                    console.log(this.businessType)
                } else if (data === "addCommunityGoods") {
                    this.businessType = "addCommunityGoods"
                }
            },

            getAll: function () {
                var data = "page=" + this.page + "&limit=" + this.limit + "&disId=" + this.disId;
                api.getAll(data)
                    .then(res => {
                        if (res) {
                            console.log(res)
                            this.communityList = res.page.list
                            this.nxSupplierId = res.page.list[0].nxDistributerSupplierId;
                            this.nxSupplierName = res.page.list[0].nxSupplierEntity.nxSupplierName;
                        }
                    })
            },

        }
    }
</script>

<style scoped>
    /*.nav-stacked>li.active>a{*/
    /*border-left-color: lightgray*/
    /*}*/

</style>

