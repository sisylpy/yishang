export default {

    path: '/communityStock',
    name: 'communityStock',
    component: () => import('@/views/CommunityManagement/CommunityStock' +
    ''),
    children: [

        // {
        //     path: 'addGoods/:goodsId',
        //     component: () => import('@/components/Background/Add_Goods'),
        //
        // }



    ]


}
