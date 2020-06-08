export default {

    path: '/supplier',
    name: 'supplier',
    component: () => import('@/views/SupplierManagement/SupplierList'),
    children: [

        // {
        //     path: 'addGoods/:goodsId',
        //     component: () => import('@/components/Background/Add_Goods'),
        //
        // }



    ]


}
