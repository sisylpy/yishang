<template>

    <!-- model-applycommit-->


    <div class="content">

        <div class="">
            <!--<p>{{fatherName}}</p>-->
            <form class="form-horizontal">



                <div class="form-group">
                    <div class="col-sm-2 control-label">选择图片</div>
                    <div class="col-sm-10 row">
                        <!---->
                        <div class="col-md-8 " style="height:120px; border: 1px solid gray;">
                            <!--<img style="height:100%;width:100%;" v-if="url!=''" :src="url" />-->
                            <!--<div style="height:100%;width:100%;"  v-else>-->
                            <!--<img style="height:100%;width:100%;" v-if="nxPromote.nxPromoteFilePath" :src="server + nxGoods.nxGoodsFile" alt="">-->
                            <!--</div>-->
                        </div>
                        <div class="col-md-4">
                            <input type="file" @change="selectImage">
                        </div>

                    </div>

                </div>


            </form>

        </div>
        <div class="row">
            <div class="col-md-offset-6">
                <button type="button" class="btn btn-sm btn-default" @click="close">关闭</button>
                <button type="button" class="btn btn-sm btn-primary" @click="saveOrUpdate">确定</button>
            </div>

        </div>
    </div>
    <!-- /.modal-content -->


</template>

<script>
    import apiComm from '@/api/community/communityGoodsData'

    export default {
        name: "AdsenseAddOne",

        data() {
            return {


                title: "新增",
                file: "",
                imgs: [],
                //判断图片的类型
                imgData: {
                    accept: 'image/gif, image/jpeg, image/png, image/jpg',
                },
                server: "http://localhost:8080/nxl_war_exploded/"


            }
        },

        props: {
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
            lydata: {
                type: Object,
                default: () => {
                    return {};
                }
            },

        },


        created() {
            // if(this.lydata.nxCgGoodsId !== null){
            //     console.log("edit")
            //     // this.getInfo();
            // }else {
            //     // this.nxGoodsFatherId = this.lydata.fatherId;
            //     // console.log("add")
            // }

        },


        methods: {

            close: function () {
                // this.goodsId = null;
                // this.nxGoods = {};
                // this.editGoodsId = null;
                // console.log(this.$layer)
                // var index1 = parent.getFrameIndex($('#nxgoods')); //先得到当前iframe层的索引
                // this.$parent.$data.editGoodsId = null;


                this.$layer.close(this.layerid);

            },

            selectImage: function (event) {
                this.file = event.target.files[0];
                // this.url = this.getObjectURL(this.file);

                let url = "";
                var reader = new FileReader();
                reader.readAsDataURL(this.file);
                let that = this;
                reader.onload = function (e) {
                    url = this.result.substring(this.result.indexOf(",") + 1);
                    that.url = "data:image/png;base64," + url;
                    // that.$refs['imgimg'].setAttribute('src','data:image/png;base64,'+url);
                };

            },

            saveOrUpdate: function (event) {

                let form = new FormData();
                form.append('file', this.file);
                form.append('nxAdsenseCommunityId', this.lydata.nxCommunityId);


                apiComm.addAdsense(form).then(res => {
                    console.log(res)
                    if (res.code == 0) {

                        // this.$parent.$data.addSuccess = "ok";
                        // this.$layer.close(this.layerid);
                    }
                })



            },
            getObjectURL(file) {
                var url = null;
                if (window.createObjectURL != undefined) { // basic
                    this.url = window.createObjectURL(file);
                } else if (window.URL != undefined) { // mozilla(firefox)
                    this.url = window.URL.createObjectURL(file);
                } else if (window.webkitURL != undefined) { // webkit or chrome
                    this.url = window.webkitURL.createObjectURL(file);
                }
                return url;
            },

        },




    }
</script>

<style>


</style>
