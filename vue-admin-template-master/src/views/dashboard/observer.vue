<template>
	<div>
		<el-row :gutter="30">
			<el-col :span="12">
				<el-card class="left">
					<div class="header1">
						<span>线上热门搜索</span>
						<el-dropdown>
							<span class="el-icon-more">
								<i class="el-icon--right"></i>
							</span>
							<el-dropdown-menu slot="dropdown">
								<el-dropdown-item>黄金糕</el-dropdown-item>
								<el-dropdown-item>狮子头</el-dropdown-item>
								<el-dropdown-item>螺蛳粉</el-dropdown-item>
								<el-dropdown-item>双皮奶</el-dropdown-item>
								<el-dropdown-item>蚵仔煎</el-dropdown-item>
							</el-dropdown-menu>
						</el-dropdown>
					</div>
					<div class="content">
						<div class="content-left">
							<div class="left-header"><span
									style="display: inline-block;margin-right: 20px;">搜索用户数</span>
								<svg t="1656986612449" class="icon" viewBox="0 0 1024 1024" version="1.1"
									xmlns="http://www.w3.org/2000/svg" p-id="2267" width="16" height="16">
									<path
										d="M544.316006 271.650957l0 53.611012c0 4.41045-2.957355 7.357572-7.357572 7.357572l-49.957809 0c-4.420683 0-7.316639-2.947122-7.316639-7.357572l0-53.611012c0-4.41045 2.895957-7.357572 7.316639-7.357572l49.957809 0C541.358651 264.293385 544.316006 267.240507 544.316006 271.650957z"
										p-id="2268" fill="#515151"></path>
									<path
										d="M542.842445 419.273109l0 337.148693c0 4.400217-2.947122 7.347339-7.357572 7.347339l-47.000454 0c-4.400217 0-7.347339-2.947122-7.347339-7.347339l0-337.148693c0-4.400217 2.947122-7.347339 7.347339-7.347339l47.000454 0C539.895323 411.92577 542.842445 414.872892 542.842445 419.273109z"
										p-id="2269" fill="#515151"></path>
									<path
										d="M1023.990786 511.994883c0 91.258447-24.313755 180.859138-70.311369 259.101129-5.730515 9.752108-18.266016 13.006222-28.007891 7.275707-9.752108-5.730515-13.006222-18.266016-7.275707-28.018124 42.303478-71.958892 64.662719-154.386206 64.662719-238.358713 0-63.59848-12.453636-125.293611-37.012985-183.356005-23.720238-56.087413-57.68377-106.464777-100.949156-149.730163-43.265386-43.265386-93.64275-77.239152-149.740396-100.95939-58.062394-24.559349-119.747291-37.002752-183.356005-37.002752s-125.293611 12.443403-183.356005 37.002752c-56.097646 23.720238-106.47501 57.694003-149.740396 100.95939s-77.228919 93.64275-100.949156 149.730163c-24.559349 58.062394-37.012985 119.757524-37.012985 183.356005 0 63.608713 12.453636 125.293611 37.012985 183.356005 23.720238 56.087413 57.68377 106.464777 100.949156 149.740396 43.265386 43.265386 93.64275 77.228919 149.740396 100.949156 58.062394 24.559349 119.747291 37.012985 183.356005 37.012985 117.946272 0 230.79648-43.797505 317.767274-123.308397 8.339946-7.623631 21.284769-7.040347 28.9084 1.299599s7.05058 21.284769-1.289366 28.9084c-94.533027 86.428442-217.196741 134.032646-345.386308 134.032646-69.114101 0-136.171356-13.538341-199.299115-40.246633-60.978816-25.787316-115.725698-62.697971-162.736385-109.708658s-83.921341-101.767801-109.708658-162.736385c-26.708292-63.127759-40.246633-130.185015-40.246633-199.299115s13.538341-136.161123 40.246633-199.299115c25.787316-60.968583 62.697971-115.715465 109.708658-162.736385 47.010687-47.010687 101.757568-83.921341 162.736385-109.708658 63.127759-26.698059 130.185015-40.2364 199.299115-40.2364s136.171356 13.538341 199.299115 40.2364c60.978816 25.787316 115.725698 62.697971 162.736385 109.708658 47.010687 47.02092 83.921341 101.767801 109.708658 162.736385C1010.442212 375.833761 1023.990786 442.880783 1023.990786 511.994883z"
										p-id="2270" fill="#515151"></path>
								</svg>

							</div>
							<div class="left-mid">
								<span style="display: inline-block;margin-right: 20px;">12442</span>
								<span>12.4</span>
								<svg t="1656987497647" class="icon" viewBox="0 0 1024 1024" version="1.1"
									xmlns="http://www.w3.org/2000/svg" p-id="3946" width="16" height="16">
									<path d="M768 384L512 128 256 384h192v512h128V384z" p-id="3947" fill="#d81e06">
									</path>
								</svg>
							</div>
							<div class="left-footer" ref="charts">

							</div>
						</div>
						<div class="content-right">
							<div class="left-header"><span
									style="display: inline-block;margin-right: 20px;">人均搜索次数</span><svg
									t="1656986612449" class="icon" viewBox="0 0 1024 1024" version="1.1"
									xmlns="http://www.w3.org/2000/svg" p-id="2267" width="16" height="16">
									<path
										d="M544.316006 271.650957l0 53.611012c0 4.41045-2.957355 7.357572-7.357572 7.357572l-49.957809 0c-4.420683 0-7.316639-2.947122-7.316639-7.357572l0-53.611012c0-4.41045 2.895957-7.357572 7.316639-7.357572l49.957809 0C541.358651 264.293385 544.316006 267.240507 544.316006 271.650957z"
										p-id="2268" fill="#515151"></path>
									<path
										d="M542.842445 419.273109l0 337.148693c0 4.400217-2.947122 7.347339-7.357572 7.347339l-47.000454 0c-4.400217 0-7.347339-2.947122-7.347339-7.347339l0-337.148693c0-4.400217 2.947122-7.347339 7.347339-7.347339l47.000454 0C539.895323 411.92577 542.842445 414.872892 542.842445 419.273109z"
										p-id="2269" fill="#515151"></path>
									<path
										d="M1023.990786 511.994883c0 91.258447-24.313755 180.859138-70.311369 259.101129-5.730515 9.752108-18.266016 13.006222-28.007891 7.275707-9.752108-5.730515-13.006222-18.266016-7.275707-28.018124 42.303478-71.958892 64.662719-154.386206 64.662719-238.358713 0-63.59848-12.453636-125.293611-37.012985-183.356005-23.720238-56.087413-57.68377-106.464777-100.949156-149.730163-43.265386-43.265386-93.64275-77.239152-149.740396-100.95939-58.062394-24.559349-119.747291-37.002752-183.356005-37.002752s-125.293611 12.443403-183.356005 37.002752c-56.097646 23.720238-106.47501 57.694003-149.740396 100.95939s-77.228919 93.64275-100.949156 149.730163c-24.559349 58.062394-37.012985 119.757524-37.012985 183.356005 0 63.608713 12.453636 125.293611 37.012985 183.356005 23.720238 56.087413 57.68377 106.464777 100.949156 149.740396 43.265386 43.265386 93.64275 77.228919 149.740396 100.949156 58.062394 24.559349 119.747291 37.012985 183.356005 37.012985 117.946272 0 230.79648-43.797505 317.767274-123.308397 8.339946-7.623631 21.284769-7.040347 28.9084 1.299599s7.05058 21.284769-1.289366 28.9084c-94.533027 86.428442-217.196741 134.032646-345.386308 134.032646-69.114101 0-136.171356-13.538341-199.299115-40.246633-60.978816-25.787316-115.725698-62.697971-162.736385-109.708658s-83.921341-101.767801-109.708658-162.736385c-26.708292-63.127759-40.246633-130.185015-40.246633-199.299115s13.538341-136.161123 40.246633-199.299115c25.787316-60.968583 62.697971-115.715465 109.708658-162.736385 47.010687-47.010687 101.757568-83.921341 162.736385-109.708658 63.127759-26.698059 130.185015-40.2364 199.299115-40.2364s136.171356 13.538341 199.299115 40.2364c60.978816 25.787316 115.725698 62.697971 162.736385 109.708658 47.010687 47.02092 83.921341 101.767801 109.708658 162.736385C1010.442212 375.833761 1023.990786 442.880783 1023.990786 511.994883z"
										p-id="2270" fill="#515151"></path>
								</svg>
							</div>
							<div class="left-mid"><span style="display: inline-block;margin-right: 20px;">12442</span>
								<span>12.4</span>
								<svg t="1656987590541" class="icon" viewBox="0 0 1024 1024" version="1.1"
									xmlns="http://www.w3.org/2000/svg" p-id="5235" width="16" height="16">
									<path d="M768 640l-256 256-256-256h192V128h128v512z" p-id="5236" fill="#1afa29">
									</path>
								</svg>
							</div>
							<div class="left-footer" ref="charts1"></div>
						</div>
					</div>
					<el-table :data="tableData" style="width: 100%" border>
						<el-table-column label="排名" width="80">
						</el-table-column>
						<el-table-column label="搜索关键字用户数" width="180">
						</el-table-column>
						<el-table-column label="周涨幅">
						</el-table-column>
					</el-table>
					<el-pagination layout="prev, pager, next" :total="1000">
					</el-pagination>
				</el-card>

			</el-col>
			<el-col :span="12">
				<el-card>
					<div class="right-header">
						<span>销售额类别占比</span>
						<el-radio-group v-model="radio1">
							<el-radio-button label="全部渠道"></el-radio-button>
							<el-radio-button label="线上"></el-radio-button>
							<el-radio-button label="门店"></el-radio-button>
						</el-radio-group>
					</div>
					<div class="right-content" ref="charts2"></div>
				</el-card>
			</el-col>
		</el-row>
	</div>
</template>

<script>
	import * as echarts from 'echarts'
	export default {
		data() {
			return {
				tableData: [{}],
				radio1: '全部渠道'
			}
		},
		mounted() {
			let charts = echarts.init(this.$refs.charts)
			charts.setOption({
				xAxis: {
					type: 'category',
					show: false
				},
				yAxis: {
					show: false
				},
				series: [{
					type: 'line',
					data: [10, 7, 33, 12, 88, 9],
					lineStyle: {
						color: 'purple'
					},
					itemStyle: {
						opacity: 0
					},
					smooth: true,
					areaStyle: {
						color: {
							type: 'linear',
							x: 0,
							y: 0,
							x2: 0,
							y2: 1,
							colorStops: [{
									offset: 0,
									color: 'purple'
								},
								{
									offset: 1,
									color: '#fff'
								}
							],
							global: false
						},
					}
				}],
				grid: {
					left: 0,
					right: 0,
					bottom: 0,
					top: 0
				}
			})
			let charts1 = echarts.init(this.$refs.charts1)
			charts1.setOption({
				xAxis: {
					type: 'category',
					show: false
				},
				yAxis: {
					show: false
				},
				series: [{
					type: 'line',
					data: [10, 7, 33, 12, 88, 9],
					lineStyle: {
						color: 'purple'
					},
					itemStyle: {
						opacity: 0
					},
					smooth: true,
					areaStyle: {
						color: {
							type: 'linear',
							x: 0,
							y: 0,
							x2: 0,
							y2: 1,
							colorStops: [{
									offset: 0,
									color: 'purple'
								},
								{
									offset: 1,
									color: '#fff'
								}
							],
							global: false
						},
					}
				}],
				grid: {
					left: 0,
					right: 0,
					bottom: 0,
					top: 0
				}
			})
			let charts2 = echarts.init(this.$refs.charts2)
			charts2.setOption({
				tooltip: {
					trigger: 'item'
				},
				title:{
					text:'视频',
					subtext:1048,
					left:'center',
					top:'center'
				},
				series: [{
					name: 'Access From',
					type: 'pie',
					radius: ['40%', '70%'],
					avoidLabelOverlap: false,
					itemStyle: {
						borderRadius: 10,
						borderColor: '#fff',
						borderWidth: 2
					},
					label: {
						show: true,
						position: 'outsize'
					},
					labelLine: {
						show: true
					},
					data: [{
							value: 1048,
							name: 'Search Engine'
						},
						{
							value: 735,
							name: 'Direct'
						},
						{
							value: 580,
							name: 'Email'
						},
						{
							value: 484,
							name: 'Union Ads'
						},
						{
							value: 300,
							name: 'Video Ads'
						}
					]
				}]
			})
			charts2.on('mouseover',(a)=>{
				const {name,value}= a.data
				charts2.setOption({
					title:{
						text:name,
						subtext:value,
					}
				})
			})
		},
		name: 'Dashboard',

	}
</script>

<style scoped>
	.right-content{
		width: 500px;
		height: 400px;
	}
	.right-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.el-pagination {
		height: 30px;
		float: right;
		width: 400px;
	}

	.left-footer {
		height: 100px;
		width: 150px;
	}

/* 	.el-dropdown-menu .el-dropdown-item {
		margin: 0;
		padding: 0;
		height: 60px;
		width: 100%;
	} */

	.el-dropdown-menu {
		padding: 0;
		width: 100px;
		height: 200px;
	}

	.header1 {
		display: flex;
		justify-content: space-between;
		margin-bottom: 20px;
	}

	.content {
		padding: 20px 0;
		border-top: 1px solid #d9d9d9;
	}

	.content-left {
		display: inline-block;
		width: 50%;
	}

	.content-right {
		display: inline-block;
		width: 50%;
	}
</style>
