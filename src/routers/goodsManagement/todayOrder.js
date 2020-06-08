export default {

    path: '/todayOrder',
    name: 'todayOrder',
    component: () => import('@/views/OrderManagement/TodayOrder'),
    children: [

        // {
        //     path: 'addGoods/:goodsId',
        //     component: () => import('@/components/Background/Add_Goods'),
        //
        // }



    ]


}
