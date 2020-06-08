<template>

    <div >
        <PageHeader/>

        <section class="content container-fluid">

            <div class="panel panel-default" id="rrapp" v-cloak>
                <div class="panel-heading" v-if="this.ckGoods.type == '0'">添加库存类别</div>
                <div class="panel-heading" v-else-if="this.ckGoods.type == '1'">添加加工类别</div>
                <div class="panel-heading" v-else>添加日采类别</div>
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-4 control-label">{{typeName}}类别名称</div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" v-model="ckGoods.goodsName" placeholder="类别名称" value="name"/>
                        </div>
                    </div>

                    <div class="form-group" v-if="this.ckGoods.type == '1'">
                        <div class="col-sm-4 control-label">价格</div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" v-model="ckGoods.price" placeholder="价格" value="name"/>
                        </div>
                    </div>
                    <div class="form-group" v-if="this.ckGoods.type == '1'">
                        <div class="col-sm-4 control-label">出货部门</div>
                        <div class="col-sm-8">
                            <select class="form-control" v-model="ckGoods.outDepId">
                                <option :value="item.depId" v-for="item in outDepArr">{{item.depName}}</option>
                            </select>                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-4 control-label">商品排序</div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" v-model="ckGoods.gSort" placeholder="商品排序" value="sort"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-2 control-label"></div>
                        <input type="button" class="btn btn-primary" @click="saveOrUpdate" value="确定" />
                        &nbsp;&nbsp;<input type="button" class="btn btn-warning" @click="back" value="返回"/>
                    </div>
                </form>
            </div>
        </section>

    </div>



</template>

<script>
    import api from '@/api/background/goods'
    import PageHeader from '@/components/PageHeader.vue'
    import apio from '@/api/background/ckDep'


    export default {
        name: "addCategory",
        data(){
          return{
              outDepArr: [],
              ckGoods: {
                  fatherId: 0,
                  type: this.$route.params.goodsType
              },
              typeName: this.$route.params.typeName,
              fatherId: this.$route.params.fatherId,
              fatherName: this.$route.params.fatherName,
          }
        },

        components:{
            PageHeader,
        },
        mounted(){
            this.getOutDepData();
            this.getInfo();

        },

        methods:{

            getInfo: function () {
                if(this.fatherId != null){
                    api.getGoodsInfo(this.fatherId).then(res => {
                        this.ckGoods = res.data;
                        $('#goodsStatus option[value= "' + this.ckGoods.status + '"]').attr("selected", true);   //设置Select的Text值为jQuery的项选中
                        $('#goodsStatus option[value= "' + this.ckGoods.isWeight + '"]').attr("selected", true);   //设置Select的Text值为jQuery的项选中
                    })
                }

            },

            getOutDepData: function (){
                var type = 1;
                apio.getOutDepList(type).then(res => {
                    if (res) {
                        this.outDepArr = res.data
                    }
                })
            },

            saveOrUpdate: function () {

                if(this.fatherId) {
                    api.updateGoods(this.ckGoods).then(res => {
                        this.$router.go(-1)

                    })

                }else{
                    api.saveGoods(this.ckGoods).then(res => {
                        this.$router.go(-1)
                    })
                }



            },

            back: function () {
                console.log("back");

                this.$router.go(-1)
            }
        }
    }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">

</style>
