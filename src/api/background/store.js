import request from '@/utils/request'

export default {

    /**
     * 修改商品
     */
    saveStore(data) {
        return request({
            url: 'sys/ckstore/save',
            method: 'post',
            data
        })
    },

    /**
     * 获取分店列表
     */
    getCommunityListAll(data) {

        return request({
            url: 'api/nxdistributercommunity/getCommunityByDistributerId/' + data,
            method: 'get',
        })
    },


    /**
     * 获取店铺信息
     */
    getStoreInfo(data) {
        return request({
            url: 'sys/ckstore/info/' + data,
            method: 'get',
        })
    },
    /**
     * gengxin
     * @param data
     */
    update(data) {
        return request({
            url: 'sys/ckstore/update',
            method: 'post',
            data
        })
    }



}
