<template>
	<el-card class="box-card">
	  <div slot="header" class="clearfix">
	    <el-tabs v-model="activeName">
	        <el-tab-pane label="销售额" name="0"></el-tab-pane>
	        <el-tab-pane label="访问量" name="1"></el-tab-pane>
	      </el-tabs>
		  <div class="right">
		  	<span>今日</span>
		  	<span>本周</span>
		  	<span>本月</span>
		  	<span>本年</span>
		  	<el-date-picker
					class="date"
		  	      type="datetimerange"
		  	      start-placeholder="开始日期"
		  	      end-placeholder="结束日期"
		  	      :default-time="['12:00:00']">
		  	    </el-date-picker>
		  </div>
		</div>
		<div>
			<el-row :gutter="10">
				<el-col :span="16">
					<div class="charts" ref="charts"></div>
				</el-col>
				<el-col :span="8" class="right">
					<h3>门店销售额排名</h3>
					<ul>
						<li>
							<span class="radius">1</span>
							<span>肯德基</span>
							<span class="radius1">123456</span>
						</li>
						<li><span class="radius">2</span>
							<span>肯德基</span>
							<span class="radius1">123456</span></li>
						<li><span class="radius">3</span>
							<span>肯德基</span>
							<span class="radius1">123456</span></li>
						<li><span>4</span>
							<span>肯德基</span>
							<span class="radius1">123456</span></li>
						<li><span>5</span>
							<span>肯德基</span>
							<span class="radius1">123456</span></li>
						<li><span>6</span>
							<span>肯德基</span>
							<span class="radius1">123456</span></li>
						<li><span>7</span>
							<span>肯德基</span>
							<span class="radius1">123456</span></li>
					</ul>
				</el-col>
			</el-row>
		</div>
	</el-card>
</template>

<script>
	import * as echarts from 'echarts'
	export default{
		name: 'sale',
		data(){
			return{
				activeName:0,
				charts:null
			}
		},
		computed:{
			title(){
				return this.activeName==0?'销售额':'访问量'
			}
		},
		watch:{
			title(){
				this.charts.setOption({
					title:{
						text:this.title+'趋势'
					}})
			}
		},
		mounted() {
			this.charts = echarts.init(this.$refs.charts)
			this.charts.setOption({
				title:{
					text:'销售额趋势'
				},
				tooltip: {
				    trigger: 'axis',
				    axisPointer: {
				      type: 'shadow'
				    }
				  },
				  grid: {
				    left: '3%',
				    right: '4%',
				    bottom: '3%',
				    containLabel: true
				  },
				  xAxis: [
				    {
				      type: 'category',
				      data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
				      axisTick: {
				        alignWithLabel: true
				      }
				    }
				  ],
				  yAxis: [
				    {
				      type: 'value'
				    }
				  ],
				  series: [
				    {
				      name: 'Direct',
				      type: 'bar',
				      barWidth: '60%',
				      data: [10, 52, 200, 334, 390, 220,124,345,123,344,222,333]
				    }
				  ]
			})
			
		}
	}
</script>

<style>
	.box-card{
		margin: 20px 0;
	}
	.radius1{
		float: right;
	}
	h3{
		margin-left: 50px;
	}
	.radius{
		display: inline-block;
		width: 16px;
		height: 16px;
		border-radius: 50%;
		color: white;
		background-color: black;
		text-align: center;
	}
	ul{
		list-style: none;
		height: 300px;
		width: 100%;
	}
	li{
		height: 8%;
		margin-top: 14px;
	}
	.charts{
		height: 300px;
		width: 100%;
	}
	.date{
		width: 100px;
		margin: 0 20px;
	}
	.right span{
		margin: 0 20px;
	}
	.right{
		position: absolute;
		right: 0;
		top: 0;
	}
	.el-card__header {
		border-bottom: none;
	}
	.clearfix{
		position: relative;
		display: flex;
		justify-content: space-between;
	}
</style>
