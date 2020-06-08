<template>

    <!-- model-applycommit-->

    <div class="my-modal-back" id="modal_inventory">
        <div class="my-modal">
            <div class="">
                <div>{{title}}</div>
                <div class="">
                    <button type="button" @click="close" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="memberWxNameApply">{{fatherName}}</h4>
                </div>
                <div class="my_modal_body">
                    <!--<p>{{fatherName}}</p>-->
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-2 control-label">商品类别名称</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="ckGoods.goodsName" placeholder="商品名称"
                                       value="name"/>
                                <input type="hidden" :name="ckGoods.fatherId" :v-model="fatherId">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-2 control-label">采购规格</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="ckGoods.purStandardName"
                                       placeholder="规格"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">申请规格</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" v-model="ckGoods.applyStandardName"
                                       placeholder="申请规格"/>
                            </div>
                        </div>

                        <!--<div class="form-group">-->
                        <!--<div class="col-sm-2 control-label">所属类型</div>-->
                        <!--<div class="col-sm-10">-->
                        <!--<select class="form-control" v-model="ckGoods.type" @change="selectGoodsType">-->
                        <!--<option :value="item.type" v-for="item in goodsTypeArr">{{item.typeName}}</option>-->
                        <!--</select>-->
                        <!--</div>-->
                        <!--</div>-->
                        <div class="form-group">
                            <div class="col-sm-2 control-label">所属大类</div>
                            <div class="col-sm-10">
                                <select class="form-control" v-model="ckGoods.fatherId">
                                    <option :value="item.goodsId" v-for="item in fatherArr">{{item.goodsName}}</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group"  v-if="goodsType !== 1">
                            <div class="col-sm-2 control-label">出货部门</div>
                            <div class="col-sm-10">
                                <select class="form-control" v-model="ckGoods.outDepId">
                                    <option :value="item.depId" v-for="item in outDepArr">{{item.depName}}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">采购部门</div>
                            <div class="col-sm-10">
                                <select class="form-control" v-model="ckGoods.purDepId">
                                    <option :value="item.depId" v-for="item in outDepArr">{{item.depName}}</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group" v-if="goodsType !== 1">
                            <div class="col-sm-2 control-label">零售价格</div>
                            <div class="col-sm-10">
                                <input class="form-control" type="number" v-model="ckGoods.price"/>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="my-modal-footer">
                    <button type="button" class="btn btn-sm btn-default" @click="close">关闭</button>
                    <button type="button" class="btn btn-sm btn-primary" @click="saveOrUpdate">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


</template>

<script>
    import api from '@/api/background/goods'
    import apio from '@/api/background/ckDep'

    export default {
        name: "AddGoods",

        data() {
            return {

                ckGoods: {
                    outDepId: '',
                    type: this.goodsType

                },

                goodsTypeArr: [
                    {type: "0", typeName: "库房商品"},
                    {type: "1", typeName: "加工商品"},
                    {type: "2", typeName: "日采商品"},
                ],
                fatherArr: [],
                selectedStatus: 1,
                outDepArr: [],
                title: "新增",


            }
        },
        props: ['editGoodsId', 'goodsType', 'fatherName', 'fatherId' ],

        watch: {
            editGoodsId: function (newVal, oldVal) {
                console.log(newVal);
                this.goodsId = newVal;

                if (newVal !== "-1") {
                    this.title = "修改";
                    this.getInfo();
                    this.getOutDepData();
                    this.getFatherList();

                }else {

                    console.log(" is null")
                    this.getOutDepData();
                    this.getFatherList();
                }
            },
            goodsType: function (newVal, oldVal) {
                this.ckGoods.type = newVal;
            }
        },



        methods: {
            getFatherList: function () {
                api.queryTypeFatherList(this.ckGoods.type).then(res => {
                    if (res) {
                        this.fatherArr = res.data;
                    }
                })
            },


            close: function () {
                $('#modal_inventory').hide();
                this.goodsId = null;
                this.ckGoods = {};
                this.$emit('submit-add');

            },


            getOutDepData: function () {
                var type = 1;
                apio.getOutDepList(type).then(res => {
                    if (res) {
                        this.outDepArr = res.data
                    }
                })
            },
            getInfo: function () {
                api.getGoodsInfo(this.goodsId).then(res => {
                    this.ckGoods = res.data;

                    $('#goodsStatus option[value= "' + this.ckGoods.status + '"]').attr("selected", true);   //设置Select的Text值为jQuery的项选中
                    $('#goodsStatus option[value= "' + this.ckGoods.isWeight + '"]').attr("selected", true);   //设置Select的Text值为jQuery的项选中

                })
            },

            saveOrUpdate: function (event) {
                if (this.ckGoods.goodsId) {
                    api.updateGoods(JSON.stringify(this.ckGoods)).then(res => {
                        $('#modal_inventory').hide();
                        // this.goodsId = null;
                        // this.ckGoods = {};
                        this.ckGoods = {
                            // outDepId: '',
                            type: this.goodsType
                        };
                        this.$emit('submit-add');
                    })
                } else {
                    console.log("save")
                    api.saveGoods(this.ckGoods).then(res => {
                        if (res.code == 0) {
                            $('#modal_inventory').hide();
                            this.$emit('submit-add');
                            this.ckGoods = {
                                // outDepId: '',
                                type: this.goodsType
                            };
                            // this.goodsId = null;

                        }
                    })
                }
            },

            // back: function () {
            //     $('#modal-warning').modal('hide')
            //
            //     this.$router.go(-1)
            // }
        }
    }
</script>

<style>


</style>
