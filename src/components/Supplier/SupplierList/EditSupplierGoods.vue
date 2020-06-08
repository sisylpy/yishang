<template>

    <!-- model-applycommit-->


            <div class="content">

                <div class="">
                    <!--<p>{{fatherName}}</p>-->
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-2 control-label">商品名称</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="商品名称"
                                     v-if="cgGoods.nxGoodsEntity.nxGoodsName !== undefined"  :value="cgGoods.nxGoodsEntity.nxGoodsName"/>
                                <input type="hidden" :name="cgGoods.nxCommunityGoodsId" :v-model="lydata.nxCommunityGoodsId">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-2 control-label">原供货价</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" :value="oldPrice"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">新供货价</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="cgGoods.nxCgBuyingPrice"
                                />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">选择图片</div>
                            <div class="col-sm-10 row">
                                <!---->
                                <div class="col-md-8 " style="height:120px; border: 1px solid gray;">
                                    <img style="height:100%;width:100%;" v-if="url!=''" :src="url" />
                                    <div style="height:100%;width:100%;"  v-else>
                                        <img style="height:100%;width:100%;"  :src="lydata.nxCommunityGoodsId" alt="">
                                    </div>
                                </div>
                                <div class="col-md-4" >
                                    <input type="file" @change="selectImage">
                                </div>

                            </div>

                        </div>


                    </form>

                </div>
                <div class="row">
                    <div class="col-md-offset-6">
                        <button  type="button" class="btn btn-sm btn-default" @click="close">关闭</button>
                        <button type="button" class="btn btn-sm btn-primary" @click="update">确定</button>
                    </div>

                </div>
            </div>
            <!-- /.modal-content -->



</template>

<script>
    import apiComm from '@/api/community/communityGoodsData'

    export default {
        name: "EditSupplierGoods",

        data() {
            return {

                url: "",
                cgGoods:{
                    nxGoodsEntity:{
                        nxGoodsName: "mingzi"
                    }

                },
                title: "新增",
                file: "",
                imgs: [],
                //判断图片的类型
                imgData: {
                    accept: 'image/gif, image/jpeg, image/png, image/jpg',
                },
                server: "http://localhost:8080/nxl_war_exploded/",
                oldPrice: "",



            }
        },

        props:{
            layerid: {//自动注入的layerid
                type: String,
                default: ''
            },
            iframeData: {//传递的数据
                type: Object,
                default: () => {
                    return {};
                }
            },
            lydata:{
                type: Object,
                default: () => {
                    return {};
                }
            },

        },



        created(){
            if(this.lydata.editGoodsId !== null){
                console.log("edit")
                this.getInfo();
            }else {
                // this.cgGoodsFatherId = this.lydata.fatherId;
                // console.log("add")
            }

        },



        methods: {

            close: function () {
                // this.goodsId = null;
                // this.cgGoods = {};
                // this.editGoodsId = null;
                // console.log(this.$layer)
                // var index1 = parent.getFrameIndex($('#nxgoods')); //先得到当前iframe层的索引
                // this.$parent.$data.editGoodsId = null;


                this.$layer.close(this.layerid);

            },

            selectImage:function(event){
                this.file = event.target.files[0];
              // this.url = this.getObjectURL(this.file);

                let url = "";
                var reader = new FileReader();
                reader.readAsDataURL(this.file);
                let that = this;
                reader.onload = function(e) {
                    url = this.result.substring(this.result.indexOf(",") + 1);
                    that.url = "data:image/png;base64," + url;
                    // that.$refs['imgimg'].setAttribute('src','data:image/png;base64,'+url);
                };

            },








            getInfo: function () {
                console.log("getInfo????")
                apiComm.cgGoodsInfo(this.lydata.nxCommunityGoodsId).then(res => {
                    console.log(res.data)
                    this.cgGoods = res.data;
                    this.oldPrice = res.data.nxCgBuyingPrice;

                    // $('#goodsStatus option[value= "' + this.cgGoods.status + '"]').attr("selected", true);   //设置Select的Text值为jQuery的项选中
                    // $('#goodsStatus option[value= "' + this.cgGoods.isWeight + '"]').attr("selected", true);   //设置Select的Text值为jQuery的项选中

                })
            },

            update: function (event) {
                let nxCommunityGoodsId = this.cgGoods.nxCommunityGoodsId;
                let nxCgBuyingPrice = this.cgGoods.nxCgBuyingPrice;

                let form = new FormData();
                form.append('file', this.file);
                form.append('nxCommunityGoodsId', nxCommunityGoodsId);
                form.append('nxCgBuyingPrice', nxCgBuyingPrice);

                apiComm.updateSupplierGoods(form).then(res => {
                    // this.goodsId = null;
                    // this.cgGoods = {};
                    this.cgGoods = null;
                    this.$parent.$data.addSuccess = "ok";
                    this.$layer.close(this.layerid);

                })
            },
            getObjectURL(file) {
                var url = null ;
                if (window.createObjectURL!=undefined) { // basic
                    this.url = window.createObjectURL(file) ;
                } else if (window.URL!=undefined) { // mozilla(firefox)
                    this.url = window.URL.createObjectURL(file) ;
                } else if (window.webkitURL!=undefined) { // webkit or chrome
                    this.url = window.webkitURL.createObjectURL(file) ;
                }
                return url ;
            },


        }
    }
</script>

<style>


</style>
