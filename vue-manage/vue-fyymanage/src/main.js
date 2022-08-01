import Vue from 'vue'
import App from './App.vue'
import { Button, Radio, Container, Main, Aside, Header, Menu, Submenu, MenuItem, MenuItemGroup, Dropdown, DropdownMenu, DropdownItem, Row, Col, Card, Table, TableColumn } from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import router from './router';
import store from './store';
import './assets/less/index.less';
import http from 'axios'
import './api/mock.js'

Vue.config.productionTip = false;
Vue.use(Button)
Vue.use(Radio)
// Vue.use(RadioGroup)
// Vue.use(RadioButton)
Vue.use(Menu)
Vue.use(Submenu)
Vue.use(MenuItem)
Vue.use(MenuItemGroup)
Vue.use(Container)
Vue.use(Main)
Vue.use(Aside)
Vue.use(Header)
Vue.use(Dropdown);
Vue.use(DropdownMenu);
Vue.use(DropdownItem);
Vue.use(Row);
Vue.use(Col);
Vue.use(Card);
Vue.use(Table)
Vue.use(TableColumn)
Vue.prototype.$http = http


new Vue({
  store,
  router,
  render: h => h(App),
}).$mount('#app')
