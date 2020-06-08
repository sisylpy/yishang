<template>

    <div class="my_panel">

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <div class="panel-title">
                    <h4 class="pull-left">
                        客户:{{customerAmount}}人
                    </h4>

                    <div class="pull-right">
                        <div class="dropdown ">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                {{}} <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li v-for="(item, index) in customerArr" :index="index" @click="changeDate(index)"><a href="#">{{}}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


        <div class="panel-body no-padding">
            <div class="box-body table-responsive no-padding">

                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th style="width: 10px">#</th>
                        <th>客户</th>
                        <th>加入时间</th>
                        <th>订货金额</th>
                        <th>订货次数</th>
                        <th style="width: 80px">用户</th>
                    </tr>
                    <tr v-for="(item, index) in customerArr">
                        <td>{{index+1}}</td>
                        <td>{{item.nxCustomerAddress}} {{item.nxCustomerName}}</td>
                        <td>{{item.nxCustomerJoinDate}}</td>
                        <td>{{item.nxCustomerOrderAmount}}</td>
                        <td>{{item.nxCustomerOrderTimes}}</td>
                        <td>
                           <div class="userColumn" v-for="(user, userIndex) in item.nxCustomerUserEntities" >
                               <img  style=" float: left;width:20px; height: 20px; border-radius: 50%;" :src="user.nxCuWxAvatarUrl"></img>
                               <div style="float: left; font-size: 12px; line-height: 20px;">{{user.nxCuWxNickName}}</div>
                           </div>
                        </td>
                        <td></td>
                    </tr>

                    </tbody>
                </table>
            </div>

        </div>

        </div>


    </div>




</template>

<script>
import api from '@/api/community/communityGoodsData'

    export default {
        name: "customer",
        props:['nxCommunityId', 'nxCommunityName', 'businessType'],
        watch:{
            nxCommunityId: function(newVal) {
                console.log(newVal)
                console.log(this.businessType)
                this.nxCommunityId = newVal;
                if(this.businessType == "customer"){
                    this.firstStoreData();
                }

            },
            businessType: function (newVal) {
                if (newVal == "customer") {
                    this.firstStoreData();

                    }
            }
        },


        methods: {
            firstStoreData: function () {

                console.log(this.nxCommunityId);
                var data = "page=" + this.page + "&limit=" + this.limit + "&nxCommunityId=" + this.nxCommunityId;
                api.getCommunityCustomers(data)
                    .then( res => {
                        console.log(res.page.list[0])
                        if(res.page) {
                            console.log(res.page)
                            this.customerArr = res.page.list;
                            this.customerAmount = res.page.totalCount;


                        }else{
                            this.customerArr = [];
                            this.bill = "";
                            this.billTotal = "";
                            this.billDate = "";
                        }
                    })
            },

            changeDate: function (index) {

                this.bill = this.customerArr[index]['ckStockRecordEntities'];

                this.billTotal = this.customerArr[index]['total'];
                this.billDate = this.customerArr[index]['billDate']
            }

        },
        data() {
            return {

                customerArr: [],
                customerAmount: "",
                page: 1,
                limit: 10,
            }
        }


    }

</script>

<style scoped>
    /*.content{*/
    /*background: #fff;*/
    /*}*/


    .panel-title {
        height: 40px;
    }

    .userColumn{
        position: relative;
        /*background: red;*/
    }




</style>
