import request from '@/utils/request'

export default {







    /**======= Weigh 接口=======
     */

    /**
     * 获取分店申请
     */
    getWeighApplyForStore(data){
        return request({
            url: 'sys/ckapplys/getSymbolizeWeighByFatherId/'+data,
            method: 'get',
        })
    },



    /**
     * 根据fatherId获取gather申请
     */
    getInventoryApplysForWeighByFatherId(data){
        return request({
            url: 'sys/ckapplys/getInventoryWeighByFatherId/'+data,
            method: 'get',
        })

    },

    /**
     * 初始化weigh
     */
    initWeightData(data) {
        return request({
            url: 'sys/ckapplys/getWeighByType/'+data,
            method: 'get',
        })

    },




    /** ====== prepare 接口 =========
    /**
     * getApplysAndSorts
     */
    initPrepareData() {
        return request({
            url: 'sys/ckapplys/getPrepare',
            method: 'get',
        })
    },


    /**
     * 记录第几次打印
     */
    getPirntMax() {
        return request({
            url: 'sys/ckapplys/getPintMax',
            method: 'get',
        })
    },


    /**
     * update
     */
    updatePrice(data) {
        return request({
            url: 'sys/ckstockrecord/update',
            method: 'post',
            data
        })
    },



    /**
     * 获取店铺出货单
     * @param data
     */
    deliveryStore() {
        return request({
            url: 'sys/ckstockrecord/getDeliveryOrderStores',
            method: 'get',
        })
    },

    getDeliveryBill(data) {
        return request({
            url: 'sys/ckstockrecord/listByStoreId/'+data,
            method: 'get',
        })
    },






    /**
     *
     */
    saveOutQuantity(data) {
        return request({
            url: 'sys/ckstockrecord/save',
            method: 'post',
            data
        })
    },

    /**======= WeighHandling ======
     *
     */

    /**
     *
     */
    saveOutQuantityHandling(data) {
        return request({
            url: 'sys/ckstockrecord/saveHandling',
            method: 'post',
            data
        })
    },







}
