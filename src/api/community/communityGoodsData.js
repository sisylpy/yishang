import request from '@/utils/request'

export default {


    //updateSupplierGoods
    updateSupplierGoods(data){
        return request({
            url: 'api/nxcommunitygoods/updateSupplierGoods',
            method: 'post',
            data
        })
    },

    //
    /**
     * 社区获取促销商品
     */
    getCommAdsense(data){
        return request({
            url: 'api/nxadsense/getListByCommunityId/' + data,
            method: 'get',
        })
    },

    /**
     * 添加促销商品
     */
    addAdsense(data) {
        return request({
            url: 'api/nxadsense/save',
            method: 'post',
            data
        })
    },

    /**
     * 社区获取促销商品
     */
    getCommPromotes(data){
        return request({
            url: 'api/nxpromote/getListByCommunityId/' + data,
            method: 'get',
        })
    },

    /**
     * 添加促销商品
     */
    addPromote(data) {
        return request({
            url: 'api/nxpromote/save',
            method: 'post',
            data
        })
    },


    cgGoodsInfo(data){
        return request({
            url: 'api/nxcommunitygoods/info/' + data ,
            method: 'get',
        })
    },


    getCommunityGoods(data){
        return request({
            url: 'api/nxcommunitygoods/getCommunityGoods',
            method: 'post',
            data
        })
    },


    getCommunityCataData(data){
        return request({
            url: 'api/nxcommunityfathergoods/getCgCateList/' + data ,
            method: 'get',
        })
    },




    postDgGoods(data){
        return request({
            url: 'api/nxcommunitygoods/postDgGoods' ,
            method: 'post',
            data
        })
    },

    /**
     * 获取社区是否下载的商品
     */
    getAddCommunityGoods(data){
        return request({
            url: 'api/nxgoods/getAddCommunityGoods' ,
            method: 'post',
            data
        })
    },


    /**
     * 获取批发商的所有社区列表
     */
    getCommunityListAll(data) {
        return request({
            url: 'api/nxdistributercommunity/getCommunityByDistributerId/' + data,
            method: 'get',
        })
    },

    /**
     * 获取社区的分页客户
     * @param data
     */
    getCommunityCustomers(data) {
        return request({
            url: 'api/nxcustomer/getCommunityCustomers',
            method: 'post',
            data
        })
    },













}
