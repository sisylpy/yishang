<template>
    <div class="box box-solid no-padding">
        <div class="box-header">

        </div>

        <div class="box-body">

            <!-- /.col -->
            <div class="col-md-12">



                <SearchGoodsTable  />
            </div>

        </div>

    </div>


</template>

<script>
    import SearchGoodsTable from '@/components/Background/Goods/Search/SearchGoodsTable.vue'

    export default {
        name: "SearchGoodsPanel",
        props:['goodsType'],


        components: {
            SearchGoodsTable,
        },
        data() {
            return{
                goodsArr: [],
                // rawArr: [],
                isactive: 0,
                fatherId: "",
                fatherName: "",
                page: 1,
                limit: 20,
                type: "2",
            }
        },
        watch: {
            goodsType: function(newVal){
                console.log("watch....")
                if(newVal == "search"){
                    // this.getCateGoods(newVal)

                }
            },
        },

        mounted() {

        },
        methods: {




        }
    }
</script>

<style scoped >

    .category{
        padding-left: 0;
    }
</style>
