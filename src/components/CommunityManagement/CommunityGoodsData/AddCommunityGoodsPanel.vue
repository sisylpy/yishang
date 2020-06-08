<template>
    <div class="row" style="min-height: 400px;">

        <div class="col-md-3 ">
            <nxGoodsTree @fatherObject="getFatherObject($event)"/>
        </div>

        <div class="col-md-9">
            <AddCommunityGoodsTreeItems :secondFatherId="secondFatherId" :secondFatherName="secondFatherName"
                                        :nxCommunityId="nxCommunityId" :businessType="businessType"/>
        </div>
    </div>
</template>

<script>
    import nxGoodsTree from '@/components/Background/Goods/NxGoods/NxGoodsTree'
    import AddCommunityGoodsTreeItems from '@/components/CommunityManagement/CommunityGoodsData/AddCommunityGoodsTreeItems.vue'

    export default {
        name: "AddCommunityGoodsPanel",
        props:['nxCommunityId','businessType'],
        components: {
            AddCommunityGoodsTreeItems,
            nxGoodsTree
        },
        watch: {
            nxCommunityId: function (newVal) {
                this.nxCommunityId = newVal;
                if (this.businessType == "addCommunityGoods") {


                }

            },
            businessType: function (newVal) {
                if (newVal == "addCommunityGoods") {
                    this.businessType = "addCommunityGoods"
                }
            }
        },
        data: function () {
            return {
                secondFatherId: "",
                secondFatherName: "",


            }

        },

        methods: {

            getFatherObject: function (obj) {
                this.secondFatherId = obj.fatherId;
                this.secondFatherName = obj.fatherName;

            },


        },
    }
</script>

<style scoped>

</style>