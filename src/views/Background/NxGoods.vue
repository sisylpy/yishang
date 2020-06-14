<template>

    <div class="">
        <PageHeader/>

        <div class="content">

            <div class="box box-default row ">


                <div class="col-md-3 ">

                    <nxGoodsTree @fatherObject="getFatherObject($event)"/>

                </div>

                <div class="col-md-9">

                    <nxGoodsPanel :secondFatherId="secondFatherId" :secondFatherName="secondFatherName"/>
                </div>
            </div>

        </div>


    </div>
</template>

<script>
    import PageHeader from '@/components/PageHeader.vue'
    import nxGoodsTree from '@/components/Background/Goods/NxGoods/NxGoodsTree'
    import nxGoodsPanel from '@/components/Background/Goods/NxGoods/NxGoodsPanel.vue'

    export default {
        name: "BackNXGoods",
        data: function () {
            return {
                secondFatherId: "",
                secondFatherName: "",


            }

        },
        components: {
            PageHeader,
            nxGoodsPanel,
            nxGoodsTree

        },

        methods: {

            getFatherObject: function (obj) {

                console.log(obj)
                this.secondFatherId = obj.fatherId;
                this.secondFatherName = obj.fatherName;


            },


        },


    }
</script>

<style>

    #menuTree {
        min-height: 400px;
    }


</style>