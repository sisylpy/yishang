export default {

    path: '/nxGoods',
    name: 'goods',
    component: () => import('@/views/Background/NxGoods'),
    children: [
        // {
        //     path: 'addGoods',
        //     name: 'addGoods',
        //     component: () => import('@/components/Background/Goods/Inventory/AddGoodsInventory'),
        //
        // },
        // {
        //     path: 'addGoods/:goodsId',
        //     component: () => import('@/components/Background/Goods/Inventory/AddGoodsInventory'),
        //
        // },




    ]


}
