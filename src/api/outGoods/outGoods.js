import request from '@/utils/request'

export default {




    /**
     *
     * @param data
     */
    getOutGoodsOfGoodsType(data) {
        return request({
            url: 'api/nxorderssub/getOutGoodsOfGoodsType',
            method: 'post',
            data
        })
    },













}
