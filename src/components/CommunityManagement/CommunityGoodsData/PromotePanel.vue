<template>

    <div class="content">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">今日促销商品</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <ul class="products-list product-list-in-box">
                    <li class="item" v-for="(item, index) in promoteList">
                        <div class="product-img">
                            <img :src="server + item.nxPromoteFilePath" alt="Product Image">
                        </div>
                        <div class="product-info">
                            <a href="javascript:void(0)" class="product-title">{{item.nxCommunityGoodsEntity.nxCgGoodsName}}
                                <span class="label label-warning pull-right">¥{{item.nxPromotePrice}}/{{item.nxPromoteStandard}}</span></a>
                            <span class="product-description">{{item.nxPromoteWords}}
                        </span>
                        </div>
                    </li>
                    <!-- /.item -->

                </ul>
            </div>
            <!-- /.box-body -->
            <!--<div class="box-footer text-center">-->
                <!--<a href="javascript:void(0)" class="uppercase">View All Products</a>-->
            <!--</div>-->
            <!-- /.box-footer -->
        </div>

    </div>

</template>

<script>
    import apiComm from '@/api/community/communityGoodsData'
    export default {
        name: "PromotePanel",
        props: ['nxCommunityId','businessType' ],

        components: {


        },
        watch: {
            nxCommunityId: function (newVal) {
                this.nxCommunityId = newVal;
                if (this.businessType == "promote") {
                    console.log("wathed promote")
                    this.getPromote();

                }

            },
            businessType: function (newVal) {
                if (newVal == "promote") {
                    console.log("wathed businessType-promote")
                    this.getPromote();

                }
            }
        },
        mounted() {
            if(!this.communityId == null){
                this.getPromote();

            }


        },

        data() {
            return {
                promoteList: [],
                server: "http://localhost:8080/nxl_war_exploded/",


            }
        },
        methods:{
            getPromote(){
              apiComm.getCommPromotes(this.nxCommunityId).then(res =>{
                  if(res){
                      console.log(res.data)
                      this.promoteList = res.data;
                  }
              })
            },
        }

    }
</script>

<style scoped>

</style>