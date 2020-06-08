import request from '@/utils/request'

export default {


    saveStandard(data){
        return request({
            url: 'api/nxstandard/save',
            method: 'post',
            data
        })
    },

    getNxStandard(data){
        return request({
            url: 'api/nxstandard/list/' + data,
            method: 'get',
        })
    },



    getGoodsTree(data) {
        return request({
            url: 'sys/menu/select',
            method: 'get',
        })
    },

    /**
     * 查询类型商品大类列表
     */
    queryTypeFatherList(data) {
        return request({
            url: 'sys/ckgoods/getTypeFatherList/' +data,
            method: 'get',
        })
    },


    /**
     * 查询商品
     * @param data
     */
    queryGoodsWithWords(data) {
        return request({
            url: 'sys/ckgoods/queryGoods/' +data,
            method: 'get',
        })
    },


    /**
     * 修改商品
     */
    saveGoods(data) {
        return request({
            url: 'api/nxgoods/save',
            method: 'post',
            data
        })
    },

    /**
     * 修改商品
     */
    updateGoods(data) {
        return request({
            url: 'sys/ckgoods/update',
            method: 'post',
            data
        })
    },

    /**
     * 获取选中商品信息
     */
    getGoodsInfo(data) {
        return request({
            url: 'api/nxgoods/info/'+ data,
            method: 'get',
            // data
        })
    },



    /**
     * nxl-获取指定商品列表
     * @param data
     */
    getCateGoodsList(data) {
        return request({
            url: 'api/nxgoods/getGoodsSubNamesByFatherId',
            method: 'post',
            data

        })
    },


    getCateGoodsTree(){
        return request({
            url: "api/nxgoods/adminGetGoodsTree",
            method: 'get',
        })
    },
    /**
     * nxl-获取类别商品
     */
    getCateGoods(data) {
      return request({
          url: "api/nxgoods/adminGetTypeGoodsCata/"+data,
          method: 'get',
      })
    },

    deleteOne(data) {
        return request({
            url: "sys/ckgoods/deleteOne/"+data,
            method: 'get',
        })
    },
    /**
     * 删除商品
     */
    deleteGoods(data) {
        return request({
            url: "sys/ckgoods/delete",
            method: 'post',
            data
        })
    },
    /**
     * upload
     */
    uploadExcel(data) {
        return request({
            url: 'api/nxgoods/uploadExcel',
            method: 'post',
            data
        })
    }



}
