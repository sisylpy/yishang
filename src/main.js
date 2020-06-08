import Vue from 'vue'
import VueCompositionAPI from './App'

import App from './App.vue'
import router from './routers/index'
import store from '../src/store/index'
import moment from 'moment'


import './adminlte/basic.css'
import './adminlte/basic'
import layer from 'vue-layer'
import 'vue-layer/lib/vue-layer.css'
import BaiduMap from 'vue-baidu-map'


Vue.prototype.$layer = layer(Vue);

Vue.use(VueCompositionAPI)
Vue.prototype.bus = new Vue;
Vue.use(BaiduMap, {
  ak: 'V5wC3GB8lDcOzuSyjqgFihciqfTVsImy'    //这个地方是官方提供的ak密钥
})
Vue.config.productionTip = true
Vue.prototype.$moment = moment;//赋值使用

moment.locale('zh-cn');//需要汉化

//注册菜单组件
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
