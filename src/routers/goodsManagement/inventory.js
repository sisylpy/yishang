export default {

    path: '/inventory',
    name: 'inventory',
    component: () => import('@/views/OrderManagement/Inventory'),
    children: [

        // {
        //     path: 'addGoods/:goodsId',
        //     component: () => import('@/components/Background/Add_Goods'),
        //
        // }



    ]


}
