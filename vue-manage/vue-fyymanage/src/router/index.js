import Vue from "vue";
import VueRouter from "vue-router";
// import Home from "../view/Home.vue.vue"

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'Main',
        component: () => import('../view/Main.vue'),
        children: [
            {
                path: '/home',
                name: 'home',
                component: () => import('../view/home')
            },
            {
                path: '/user',
                name: 'user',
                component: () => import('../view/user')
            },
            {
                path: "/mall",
                name: "mall",
                component: () => import('../view/mall')
            },
            {
                path: "/location",
                name: "location",
                children: [
                    {
                        path: "/page1",
                        name: "page1",
                        component: () => import('../view/page1')
                    },
                    {
                        path: "/page2",
                        name: "page2",
                        component: () => import('../view/page2')
                    },
                ]
            }
        ]
    },
]

const router = new VueRouter({
    mode: "history",
    routes
})
export default router