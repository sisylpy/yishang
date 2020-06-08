<template>

    <div class="content">



    <div>

        配送地址<input type="text" >
        <button class="btn-default" @click="updateComm">保存</button>

    </div>

        <!-- syncPolyline  paintPolyline -->
                <baidu-map v-bind:style="mapStyle" class="bm-view"
                           center="燕郊"
                           :zoom="zoom"
                           :map-click="false"
                           @mousemove="toSeeMove"
                           @click="toSeeClick"
                           @rightclick="newPolyline"
                >
                    <bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-navigation>
                    <bm-overview-map anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :isOpen="true"></bm-overview-map>
                    <bm-geolocation anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :showAddressBar="true"
                                    :autoLocation="true"></bm-geolocation>
                    <bm-polygon
                            :path="path"
                             v-for="path of polygonPath.paths"
                            :key="path.toString()"
                            stroke-color="blue"
                                     fill-color="lightblue"
                                     :fill-opacity="0.8"
                                     :stroke-opacity="0.5"
                                     :stroke-weight="2"
                                     @click="alertpath"
                                   />

                    <!--<bm-polygon :path="ppp" stroke-color="blue" :stroke-opacity="0.5" :stroke-weight="2" :editing="true" @lineupdate="updatePolygonPath"/>-->



                    <bm-control :offset="{width: '10px', height: '10px'}">
                        <button @click="toggle('polygonPath')">{{ polygonPath.editing ? '停止绘制' : '开始绘制' }}</button>

                        <bm-auto-complete v-model="keyword" :sugStyle="{zIndex: 999999}">

                        <input type="text" placeholder="请输入搜索关键字" class="serachinput">
                        </bm-auto-complete>
                    </bm-control>
                    <bm-local-search :keyword="keyword" :auto-viewport="true"
                                     style="width:0px;height:0px;overflow: hidden;"></bm-local-search>


                    <bm-marker :position="{lng: marker.lng, lat: marker.lat}" :dragging="true" >
                        <bm-label content="配送点"  :labelStyle="{color: 'blue', fontSize : '18px'}" :offset="{width: -35, height: 30}"/>
                    </bm-marker>

                    <!--<bm-marker :position="{lng: center.lng, lat: center.lat}" :dragging="true" animation="BMAP_ANIMATION_BOUNCE">-->
                        <!--<bm-label content="配送点" :labelStyle="{color: 'red', fontSize : '18px'}" :offset="{width: -15, height: 30}"/>-->
                    <!--</bm-marker>-->

                </baidu-map>


    </div>


</template>

<script>
    import apiDelivery from '@/api/community/communityDelivery'
    export default {
        name: "CommunityMapPanel",
        props: {

            value: Boolean,
            mapHeight: {
                type: Number,
                default: 500
            },
            nxCommunityId:{
                type: Number,
                default: ""
            },

        },

        components: {},
        watch: {
            value: function (currentValue) {
                this.showMapComponent = currentValue
                if (currentValue) {
                    this.keyword = ''
                }
            },
            nxCommunityId: function (newVal) {
                this.nxCommunityId = newVal;
                // if (this.businessType == "adsense") {
                //     console.log("wathed adsense")
                //     this.getAdsense();
                //
                // }
                this.getInfo();


            },

        },
        mounted() {





        },

        data() {
            return {
                polygonPath: {
                    editing: false,
                    paths: [] // 绘制完成后的经纬度，其实是在画的时候动态push的，因为在点击的时候触发了 paintPolygon 函数
                     },
                showMapComponent: this.value,
                keyword: '',
                mapStyle: {
                    width: '100%',
                    height: this.mapHeight + 'px'
                },
                // center: {lng: 116.404, lat: 39.915},
                zoom: 15,
                marker:{
                    lng: "",
                    lat: ""

                },
                communityObj: {},
                nxCommunityPolygon: [],
                ppp: "",
                center: {
                    lat: "",
                    lng: ""
                }

            }


        },
        methods: {

            getInfo(){
                console.log("getinfo.....")
                apiDelivery.info(this.nxCommunityId).then(res =>{
                    if(res){
                        console.log(JSON.parse(res.data.nxCommunityPolygon).data)
                        this.communityObj = res.data;
                        this.nxCommunityPolygon = JSON.parse(res.data.nxCommunityPolygon).data;
                        // this.ppp = this.nxCommunityPolygon;
                        var arr = [];
                        for (var i = 0; i < this.nxCommunityPolygon.length; i++){
                            console.log(i);
                            var one  = this.nxCommunityPolygon[i];
                            var pointlat = one.lat;
                            var pointlng = one.lng;
                            var point = {
                                "lng": Number(pointlng),
                                "lat": Number(pointlat)
                            }

                            arr.push(point)
                        }
                        this.ppp = arr;
                        console.log( typeof arr)
                        console.log(Number(res.data.nxCommunityLat) )
                        this.center.lng = Number(res.data.nxCommunityLng) ;
                        this.center.lat = Number(res.data.nxCommunityLat) ;


                    }
                })
            },

            updateComm(){
                var polygons = [];
                var length = this.polygonPath.paths[0].length;
                console.log(length)
                    for(var i = 0; i < length; i++){
                        var path = {
                            lng: this.polygonPath.paths[0][i].lng,
                            lat: this.polygonPath.paths[0][i].lat,
                        }
                        console.log(path)
                        polygons.push(path);

                    }
                 var aaa = {
                        id: this.nxCommunityId,
                        data: polygons
                 }

                var data = {
                    nxCommunityId: this.nxCommunityId,
                    nxCommunityLat: this.marker.lat,
                    nxCommunityLng: this.marker.lng,
                    nxCommunityPolygon: JSON.stringify(aaa)

                }


                apiDelivery.update(data).then(res =>{
                    if(res) {
                        console.log(res)
                    }
                })

            },

            toSeeMove(e){
                if(this.polygonPath.editing){
                    this.syncPolyline(e);

                }  else{
                    return;

                }
            },

            toSeeClick(e){
              if(this.polygonPath.editing){
                  this.paintPolyline(e);
              }  else{
                  this.addMarker(e)
              }
            },

            addMarker(e){

                this.marker.lng = e.point.lng;
                this.marker.lat = e.point.lat;

              console.log(this.marker)
            },

            toggle(name) {
                this[name].editing = !this[name].editing
                console.log(this[name])
            },
            syncPolyline(e) {
                console.log(paths)
                if (!this.polygonPath.editing) {
                    return
                }
                const {paths} = this.polygonPath
                if (!paths.length) {
                    return
                }
                const path = paths[paths.length - 1]
                if (!path.length) {
                    return
                }
                if (path.length === 1) {
                    path.push(e.point)
                }
                this.$set(path, path.length - 1, e.point)
            },
            newPolyline(e) {
                if (!this.polygonPath.editing) {
                    return
                }
                this['polygonPath'].editing = !this['polygonPath'].editing

                const {paths} = this.polygonPath
                if (!paths.length) {
                    paths.push([])
                }
                const path = paths[paths.length - 1]
                path.pop()
                if (path.length) {
                    paths.push([])
                }
            },
            paintPolyline(e) {
                if (!this.polygonPath.editing) {
                    return
                }
                const {paths} = this.polygonPath
                !paths.length && paths.push([])
                paths[paths.length - 1].push(e.point)
            },
            alertpath (e) {
                 console.log(e.currentTarget.so)
                console.log(this.polygonPath.paths[0])
              },


            updatePolygonPath (e) {
                this.polygonPath = e.target.getPath()
            },




        }

    }
</script>

<style scoped>
    .map {
        width: 100%;
        height: 300px;
    }
</style>