import request from '@/utils/request'

export default {


    //
    info(data){
        return request({
            url: 'api/nxcommunity/info/' +data,
            method: 'get',
        })
    },

    save(data){
        return request({
            url: 'api/nxcommunity/save',
            method: 'post',
            data
        })
    },

    update(data){
        return request({
            url: 'api/nxcommunity/update',
            method: 'post',
            data
        })
    }















}
