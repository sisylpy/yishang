<template>

    <div class="content">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">广告位</h3>

                <div class="box-tools pull-right">
                    <div class="btn-group">
                        <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-wrench"></i></button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a @click="add">新增</a></li>
                            <li><a @click="">修改</a></li>
                            <li><a >删除</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="box-body">
                    <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->

                    <ul class="todo-list row" id="adsense_list">

                        <li class="handle_li col-md-4" v-for='(item, index) in adsenseArr'
                            :id="item.storeId">
                            <span class="handle">
                <i class="fa fa-ellipsis-v"></i>
                <i class="fa fa-ellipsis-v"></i>
                </span>
                            <span class="text">{{item.nxAdsenseFilePath}}</span>
                            <img :src="server + item.nxAdsenseFilePath" style="width: 150px; height: 90px;">
                        </li>

                    </ul>
                </div>

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
    import AdsenseAddOne from '@/components/CommunityManagement/CommunityGoodsData/AdsenseAddOne.vue'
    export default {
        name: "AdsensePanel",
        props: ['nxCommunityId','businessType' ],

        components: {
            AdsenseAddOne

        },
        watch: {
            nxCommunityId: function (newVal) {
                this.nxCommunityId = newVal;
                if (this.businessType == "adsense") {
                    console.log("wathed adsense")
                    this.getAdsense();

                }

            },
            businessType: function (newVal) {
                if (newVal == "adsense") {
                    console.log("wathed businessType-adsense")
                    this.getAdsense();

                }
            }
        },
        mounted() {

         // this.getPromote();
            var that = this;

            $("#adsense_list").sortable({
                cursor: "move",
                // items :"li",                        //只是li可以拖动
                // opacity: 0.6,                       //拖动时，透明度为0.6
                // revert: true,
                // stop: function() {
                //记录sort后的id顺序数组
                // this.selStoreArr = $("#handle_list2").sortable('toArray');
                //拖拽后利用localStorage记录顺序
                // localStorage.arr = arr;
                // },//释放时，增加动画
                update: function () {
                    console.log("update");
                    var result = $(this).sortable('toArray')
                    var arr = [];
                    for (var i = 0; i < result.length; i++) {
                        var ids = result[i];
                        var store = {
                            storeId: ids,
                        }
                        arr.push(store)
                    }
                    // that.line.storeEntityList = arr;

                    console.log(this);
                    console.log(that);


                }

            });



        },

        data() {
            return {
                adsenseArr: [],
                server: "http://localhost:8080/nxl_war_exploded/",

            }
        },
        methods:{
            getAdsense(){
              apiComm.getCommAdsense(this.nxCommunityId).then(res =>{
                  if(res){
                      console.log(res.data)
                      this.adsenseArr = res.data;
                  }
              })
            },

            add(){

                this.addAdsenseLayer();
            },


            addAdsenseLayer:function(){
                this.$layer.iframe({
                    type: 4, //0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    title: this.layerTitle,
                    content: {
                        content: AdsenseAddOne,
                        parent: this,
                        data: {
                            nxCommunityId: this.nxCommunityId,
                        }

                    },
                    area: 'auto',
                    offset: 'auto',
                    icon: -1,
                    btn: '确定1',
                    time: 0,
                    shade: true,//是否显示遮罩
                    cancel: '',
                    tips: [0,{}],//支持上右下左四个方向，通过1-4进行方向设定,可以设定tips: [1, '#c00']
                    tipsMore: false,//是否允许多个tips
                    shadeClose: true,//点击遮罩是否关闭
                    maxmin: false,//开启最大化最小化
                    scrollbar: true, //是否允许浏览器出现滚动条:默认是允许
                    resize: false, //是否允许拉伸，默认是不允许
                    yes: '',

                });
            },
        }

    }
</script>

<style scoped>

</style>