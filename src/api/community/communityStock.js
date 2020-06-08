import request from '@/utils/request'

export default {


    //

    saveInBill(data){
        return request({
            url: 'api/nxcommunitystock/save',
            method: 'post',
            data
        })
    },

    queryGoodsWithPinyin(data){
        return request({
            url: 'api/nxcommunitygoods/queryGoodsWithPinyin',
            method: 'post',
            data
        })
    },


    getStockGoods(data){
        return request({
            url: 'api/nxcommunitygoods/getStockGoods',
            method: 'post',
            data
        })
    },

















}
