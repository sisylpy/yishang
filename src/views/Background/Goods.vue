<template>
    <div class="">
        <PageHeader/>

            <section class="content">

                    <div class="nav-tabs-custom no-border">

                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-left">

                            <li v-for="(item,index) in goodsArr" v-bind:key="item.nxGoodsId" :id="item.nxGoodsId"
                                :class="isactive == index ? 'active' : '' "
                                @click='onclick(item.nxGoodsId, index)'>
                                <a >{{item.nxGoodsName}}</a>
                            </li>
                        </ul>

                        <div class="tab-content no-padding">

                            <div class="chart tab-pane active ">
                                <InventoryTypeGoodsPanel :secondFatherId="secondFatherId"/>
                            </div>

                        </div>
                    </div>

            </section>

    </div>
</template>

<script>
    import PageHeader from '@/components/PageHeader.vue'
    import InventoryTypeGoodsPanel from '@/components/Background/Goods/Inventory/InventoryTypeGoodsPanel.vue'
    import HandlingTypeGoodsPanel from '@/components/Background/Goods/Handling/HandlingTypeGoodsPanel.vue'
    import DailyTypeGoodsPanel from '@/components/Background/Goods/Daily/DailyTypeGoodsPanel.vue'
    import SearchGoodsPanel from '@/components/Background/Goods/Search/SearchGoodsPanel.vue'
    import api from '../../api/background/goods'



    export default {
        name: "nxGoods",
        data() {
            return {
                goodsArr: [],
                secondFatherId: "",
                firstGoodsId: 0

            }
        },
        mounted() {
            //todo
            // this.firstGoodsId = this.$route.params.fatherId;
            // this.firstGoodsId = 0;
            this.getCateGoods();
        },

        watch:{
            '$route.params'(newval, oldval) {
                console.log(newval)
                let indexarr = this.$route.params.indexObj.split('-');
                let fatherIndex = Number(indexarr[0]);
                this.pname = menuComponents[fatherIndex].pname;
                this.menuList = menuComponents[fatherIndex].children;
                this.imgUrl = this.imgs[fatherIndex];
                this.showNewscontent(Number(indexarr[1]))
            }
        },

        // watch: {
        //
        //     // $route(){
        //     //     this.firstGoodsId = this.$route.params.fatherId
        //     // },
        //     $route: {
        //         handler: function(val, oldVal){
        //             console.log(val);
        //         },
        //         // 深度观察监听
        //         deep: true
        //     },
        //
        //     firstGoodsId() {
        //         console.log("routtotuotuto2222");
        //         this.getCateGoods()
        //     },
        //
        //     '$route.params'(newval, oldval) {
        //         console.log(newval)
        //         // let indexarr = this.$route.params.indexObj.split('-');
        //         // let fatherIndex = Number(indexarr[0]);
        //         // this.pname = menuComponents[fatherIndex].pname;
        //         // this.menuList = menuComponents[fatherIndex].children;
        //         // this.imgUrl = this.imgs[fatherIndex];
        //         // this.showNewscontent(Number(indexarr[1]))
        //     },
        //
        // },

        // beforeRouteEnter (to, from, next) {
        //     // 在渲染该组件的对应路由被 confirm 前调用
        //     // 不！能！获取组件实例 `this`
        //     // 因为当守卫执行前，组件实例还没被创建
        //
        //     next(vm => {
        //         // 通过 `vm` 访问组件实例
        //         vm.data.firstGoodsId = to.params.fatherId;
        //     })
        // },

        components: {
            PageHeader,
            InventoryTypeGoodsPanel,
            HandlingTypeGoodsPanel,
            DailyTypeGoodsPanel,
            SearchGoodsPanel,


    },
        methods: {
            //点击产品类别
            onclick(data, index) {
                this.secondFatherId = data;
                this.isactive = index;
            },

            getCateGoods: function () {
                api.getCateGoods(1).then(res => {

                    if (res) {
                        this.secondFatherId = res.data[0].nxGoodsId;
                        this.goodsArr = res.data;
                        this.fatherName = res.data[0].nxGoodsName;
                        this.isactive = 0;
                    }
                })

            },
        }

    }
</script>

<style scoped>
.category{
    padding-left: 0;
}
.tab-content>.active {
    display: block;
    border: none;
}


</style>
