import request from '@/utils/request'

export default {






    getSupplierGoodsData(data) {
        return request({
            url: 'api/nxcommunitygoods/getSupplierGoods',
            method: 'post',
            data
        })
    },

    /**
     * 获取全部供货商
     */
    getAll(data) {
        return request({
            url: 'api/nxdistributersupplier/list',
            method: 'post',
            data
        })
    },

    /**
     * 删除申请
     */
    delateApplyById(data) {
        return request({
            url: 'sys/ckapplys/deleteOne/'+data,
            method: 'get',
        })
    }







}
