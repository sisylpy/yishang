<template>



    <div>

    <div class="wrapper" v-cloak>

        <!-- Main Header -->
        <header class="main-header">

            <a href="javascript:void(0);" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <!--<span class="logo-mini"><b>一商</b></span>-->
                <span class="logo-mini"><b>一商</b></span>
                <!-- logo for regular state and mobile devices -->
                <!--<span class="logo-lg"><b>一商.订货加工系统</b></span>-->
                <span class="logo-lg"><b>连锁直营店订货管理系统</b></span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button   offcanvas -->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <div style="float:left;color:#fff;padding:15px 10px;">欢迎 {{user.username}}</div>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li><a href="http://www.baidu.com" target="_blank"><i class="fa fa-home"></i> &nbsp;待办事项</a></li>
                        <li><a href="javascript:;" @click="updatePassword"><i class="fa fa-lock"></i> &nbsp;修改密码</a></li>
                        <li><a @click="logout"><i class="fa fa-sign-out"></i> &nbsp;退出系统</a></li>
                    </ul>
                </div>
            </nav>
        </header>


        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">

            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">

                 <!--Sidebar Menu -->
                <ul class="sidebar-menu" data-widget="tree">

                    <li class="header">导航菜单</li>

                    <menu-item  :item="item" v-for="item in menuList" v-bind:key="item.id"></menu-item>

                </ul>
                <!-- /.sidebar-menu -->
            </section>
            <!-- /.sidebar -->
        </aside>


        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper" style="min-height: unset">

                <router-view/>

        </div>
        <!-- /.content-wrapper -->

        <!-- Main Footer -->
        <footer class="main-footer">
            <!-- To the right -->
            <div class="pull-right hidden-xs">
                Anything you want
            </div>
            <!-- Default to the left -->
            <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
        </footer>

        <!--&lt;!&ndash; Control Sidebar &ndash;&gt;-->
        <!--<aside class="control-sidebar control-sidebar-dark">-->
            <!--&lt;!&ndash; Create the tabs &ndash;&gt;-->
            <!--<ul class="nav nav-tabs nav-justified control-sidebar-tabs">-->
                <!--<li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>-->
                <!--<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>-->
            <!--</ul>-->
            <!--&lt;!&ndash; Tab panes &ndash;&gt;-->
            <!--<div class="tab-content">-->
                <!--&lt;!&ndash; Home tab content &ndash;&gt;-->
                <!--<div class="tab-pane active" id="control-sidebar-home-tab">-->
                    <!--<h3 class="control-sidebar-heading">Recent Activity</h3>-->
                    <!--<ul class="control-sidebar-menu">-->
                        <!--<li>-->
                            <!--<a href="javascript:;">-->
                                <!--<i class="menu-icon fa fa-birthday-cake bg-red"></i>-->

                                <!--<div class="menu-info">-->
                                    <!--<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>-->

                                    <!--<p>Will be 23 on April 24th</p>-->
                                <!--</div>-->
                            <!--</a>-->
                        <!--</li>-->
                    <!--</ul>-->
                    <!--&lt;!&ndash; /.control-sidebar-menu &ndash;&gt;-->

                    <!--<h3 class="control-sidebar-heading">Tasks Progress</h3>-->
                    <!--<ul class="control-sidebar-menu">-->
                        <!--<li>-->
                            <!--<a href="javascript:;">-->
                                <!--<h4 class="control-sidebar-subheading">-->
                                    <!--Custom Template Design-->
                                    <!--<span class="pull-right-container">-->
                    <!--<span class="label label-danger pull-right">70%</span>-->
                  <!--</span>-->
                                <!--</h4>-->

                                <!--<div class="progress progress-xxs">-->
                                    <!--<div class="progress-bar progress-bar-danger" style="width: 70%"></div>-->
                                <!--</div>-->
                            <!--</a>-->
                        <!--</li>-->
                    <!--</ul>-->
                    <!--&lt;!&ndash; /.control-sidebar-menu &ndash;&gt;-->

                <!--</div>-->
                <!--&lt;!&ndash; /.tab-pane &ndash;&gt;-->
                <!--&lt;!&ndash; Stats tab content &ndash;&gt;-->
                <!--<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>-->
                <!--&lt;!&ndash; /.tab-pane &ndash;&gt;-->
                <!--&lt;!&ndash; Settings tab content &ndash;&gt;-->
                <!--<div class="tab-pane" id="control-sidebar-settings-tab">-->
                    <!--<form method="post">-->
                        <!--<h3 class="control-sidebar-heading">General Settings</h3>-->

                        <!--<div class="form-group">-->
                            <!--<label class="control-sidebar-subheading">-->
                                <!--Report panel usage-->
                                <!--<input type="checkbox" class="pull-right" checked>-->
                            <!--</label>-->

                            <!--<p>-->
                                <!--Some information about this general settings option-->
                            <!--</p>-->
                        <!--</div>-->
                        <!--&lt;!&ndash; /.form-group &ndash;&gt;-->
                    <!--</form>-->
                <!--</div>-->
                <!--&lt;!&ndash; /.tab-pane &ndash;&gt;-->
            <!--</div>-->
        <!--</aside>-->
        <!--&lt;!&ndash; /.control-sidebar &ndash;&gt;-->
        <!--&lt;!&ndash; Add the sidebar's background. This div must be placed-->
        <!--immediately after the control sidebar &ndash;&gt;-->
        <!--<div class="control-sidebar-bg"></div>-->
    </div>
    <!-- ./wrapper -->



        <loading></loading>


    </div>



</template>

<script>
    import api from './api/user'
    import menuItem from './components/MenuItem'
    import tips from '@/components/common/tips'
    import loading from '@/components/common/loading'

    export default {
        name: "adminlte",
        components: {
            menuItem,
            tips,
            loading,

        },
        created: function () {
            this.getMenuList();
            this.getUser();
            // this.getSessionStorage();

        },
        data:function () {
            return {
                user: {},
                menuList: {},
                item: {},
                navTitle: "Dashboard",
                main: "sys/main.html",

            }
        },
        methods: {

            changeSidebar(){


                // $("#jqGrid_outStocking").setGridWidth($("#enterOutGoods").width()*0.99);
                // $("#jqGrid_outStocking").setGridWidth(document.body.clientWidth*0.99);
                if( $("body").hasClass("sidebar-collapse")) {
                    this.$store.state.orders.sideBar  = "guan";

                }else {
                    this.$store.state.orders.sideBar  = "kai";

                }
            },


            getSessionStorage: function(){
                console.log(sessionStorage);
                console.log("sessionssttttrage!!")

                if (sessionStorage.getItem("store") ) {
                    this.$store.replaceState(Object.assign({}, this.$store.state,JSON.parse(sessionStorage.getItem("store"))))
                }
                window.addEventListener("beforeunload",()=>{
                    sessionStorage.setItem("store",JSON.stringify(this.$store.state))
                })
            },

            getUser: function () {
                // this.$store.dispatch('sysUser/GetUserInfo').then(res => {
                //     if(res) {
                //         this.user =res.user;
                //     }
                // })
                api.getUserInfo().then(res => {

                    if(res.user) {
                        console.log(res)
                    }else {
                        window.location.href = 'login.html'

                    }
                })

            },
            getMenuList: function(){
                api.getSideBarList().then(res => {
                    if(res) {
                        this.menuList = res.menuList
                    }
                })
            },
            updatePassword: function () {
                console.log("update");

            },

            logout: function () {
                api.logout().then(res => {
                    console.log(res);
                    if(res.code == 0){//登录成功

                        window.location.href= 'login.html'
                    }else{
                        this.error = true;
                        this.errorMsg = res.msg;
                    }


                })
            }



        },





    }
</script>

<style>
    ul {
        padding-inline-start: 0;

    }
    ul li {
        list-style: none;

    }
    .wrapper{
      height: 600px;
    }
    /**app.wxss**/
    /* 页面 */

    .customerPage{
        background: #f5f5f5;
        width: 100%;
        height: 100%;
    }
    .wrapper {
        width: 100%;
        height: 100%;
        background: #f2f9fc;
    }

    /* 块 */
    .section {
        margin-top: 10rem;
        background: #fff;
        width: 100%;
    }
    .whiteBack {
        background: #fff;
    }

    .row {
        width: 100%;
    }



    /* 块效果 */
    .filter {
        filter: grayscale(100%);
        -webkit-filter: grayscale(100%);
    }
    .with-border-bottom {
        border-bottom: 1px solid rgba(231, 230, 230, 0.548);
    }
    .with-border-bottom-main {
        border-bottom: 1px solid rgb(70, 69, 69);
    }
    .with-border-bottom.is-last {
        border-bottom: none;
    }

    .icon{
        width: 4rem;
        height: 4rem;
    }


    /* 各种Padding */
    .with-padding {
        padding: 1rem;
    }
    .with-tb-padding {
        padding-top: 1rem;
        padding-bottom: 1rem;
    }
    .with-stb-padding{
        padding-top: 1rem;
        padding-bottom: 1rem;
    }
    .with-lr-padding {
        padding-left: 1rem;
        padding-right: 1rem;
    }
    .with-slr-padding {
        padding-left: 0.5rem;
        padding-right: 0.5rem;
    }
    .with-r-padding{
        padding-right: 2rem;
    }
    .with-l-padding{
        padding-left: 2rem;
    }


    /* 各种Flex */

    .space-around {
        display: flex;
        flex-flow: row nowrap;
        justify-content: space-around;
        align-items: center;
    }

    .flex-row {
        display: flex;
        flex-flow: row nowrap;
        justify-content: flex-start;
        align-items: center;
    }
    .flex-row-between {
        display: flex;
        flex-flow: row nowrap;
        justify-content: space-between;
        align-items: center;
    }
    .flex-row-around {
        display: flex;
        flex-flow: row nowrap;
        justify-content: space-around;
        align-items: center;
    }
    .flex-row-end{
        display: flex;
        flex-flow: row nowrap;
        align-items: flex-end;
    }
    .flex-row-wrap{
        display: flex;
        flex-flow: row nowrap;
    }

    .flex-column {
        display: flex;
        flex-flow: column nowrap;
        justify-content: flex-start;
        /* align-items: center; */
    }

    .flex-column-center {
        display: flex;
        flex-flow: column nowrap;
        justify-content: space-around;
        align-items: center;
    }



    .margin-right {
        margin-right: 2rem;
    }
    .margin-l-right{
        margin-right: 1rem;
    }
    .margin_bottom{
        margin-bottom: 2rem;
    }
    .margin_l_bottom{
        margin-bottom: 1rem;
    }

    /* 各种字体 */

    .explain-words {
        font-size: 4rem;
        color: gray;
    }

    .small{
        font-size: 3rem;
    }
    .middleBlack{
        font-size: 2rem;
    }
    .normal{
        font-size: 8rem;
    }
    .smallGray{
        font-size: 3rem;
        color: gray;
    }

    .smallBlack{
        font-size: 3rem;
    }

    .weight_five{
        font-weight: 500;
    }
    .weight_three{
        font-weight: 300;
    }
    .smallYellow{
        color: rgb(255, 196, 0);
        font-size: 2rem;
    }

    .bigYellow{
        color: rgb(255, 196, 0);
        font-size: 3rem;
    }

    .yuan{
        font-size: 2rem;
    }
    /* color */
    .m_color{
        color: rgb(255, 196, 0);
    }
    .m_is_active{
        color:#fb0;
    }

    .back_m_color{
        color: #e69705;
    }
    .red{
        color: red;
    }
    /* line */

    .grayLine{
        height: 1px;
        width: 100%;
        background: lightgray;
    }



</style>
