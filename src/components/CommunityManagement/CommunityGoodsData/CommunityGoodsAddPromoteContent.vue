<template>

    <!-- model-applycommit-->


    <div class="content">

        <div class="">
            <!--<p>{{fatherName}}</p>-->
            <!--<form class="">-->
                <div class="row">

                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-sm-2 control-label">促销原价</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" :value="nxOrignalPrice"
                                       disabled />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-2 control-label">促销价格</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="nxPromote.nxPromotePrice"
                                       placeholder="规格"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2 control-label">促销规格</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="nxPromote.nxPromoteStandard"
                                       placeholder="规格"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2 control-label">促销重量</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="nxPromote.nxPromoteWeight"
                                       placeholder="规格"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2 control-label">保质期</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="nxPromote.nxPromoteStorage"
                                       placeholder="规格"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2 control-label">储存条件</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="nxPromote.nxPromoteExpired"
                                       placeholder="规格"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">

                        <div class="row">
                            <div class="col-sm-2 control-label">促销语句</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="nxPromote.nxPromoteWords"
                                       placeholder="规格"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2 control-label">推荐商品idlist</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="nxPromote.nxPromoteRecommandGoods"
                                       placeholder="规格"/>
                            </div>
                        </div>

                        <div class="row">
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
                    </div>

                </div>





            <!--</form>-->

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
        name: "CommunityGoodsAddPromoteContent",

        data() {
            return {

                url: "",
                nxPromote: {},
                title: "新增",
                file: "",
                imgs: [],
                //判断图片的类型
                imgData: {
                    accept: 'image/gif, image/jpeg, image/png, image/jpg',
                },
                server: "http://localhost:8080/nxl_war_exploded/",
                nxOrignalPrice: "",
                nxCgCfGoodsFatherId: "",


            }
        },

        props: ['nxCgGoodsId'],


        created() {
            if(this.nxCgGoodsId !== null){
                console.log("edit")
                this.getInfo();
            }else {
                // this.nxGoodsFatherId = this.lydata.fatherId;
                // console.log("add")
            }

        },


        methods: {

            close() {
                console.log("guanbi")
                this.$emit('hidden')
            },

            getInfo: function () {
                console.log("getInfo????")
                apiComm.cgGoodsInfo(this.nxCgGoodsId).then(res => {
                    if(res){
                        console.log(res.data)

                        this.nxOrignalPrice = res.data.nxCgGoodsPrice + "." +res.data.nxCgGoodsPriceDecimal;
                        this.nxCgCommunityId = res.data.nxCgCommunityId;
                        this.nxCgCfGoodsFatherId = res.data.nxCgCfGoodsFatherId;
                    }

                })
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
                form.append('nxPromoteCgId', this.nxCgGoodsId);
                form.append('nxOrignalPrice', this.nxOrignalPrice);
                form.append('nxPromotePrice', this.nxPromote.nxPromotePrice);
                form.append('nxPromoteStandard', this.nxPromote.nxPromoteStandard);
                form.append('nxPromoteWeight', this.nxPromote.nxPromoteWeight);
                form.append('nxPromoteExpired', this.nxPromote.nxPromoteExpired);
                form.append('nxPromoteStorage', this.nxPromote.nxPromoteStorage);
                form.append('nxPromoteWords', this.nxPromote.nxPromoteWords);
                form.append('nxPromoteCommunityId', this.nxCgCommunityId);
                form.append('nxPromoteRecommandGoods', this.nxPromote.nxPromoteRecommandGoods);
                form.append('nxPromoteCgFatherId', this.nxCgCfGoodsFatherId);


                apiComm.addPromote(form).then(res => {
                    console.log(res)
                    if (res.code == 0) {

                        this.nxPromote = null
                        this.$parent.$data.addSuccess = "ok";
                        this.close();

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
