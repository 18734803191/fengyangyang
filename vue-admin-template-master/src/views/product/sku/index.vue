<template>
	<div>
		<el-table border style="width: 100%" :data="skulist">
			<el-table-column type="index" label="序号" width="80" align="center"></el-table-column>
			<el-table-column prop="skuName" label="名称" width="width" align="center"></el-table-column>
			<el-table-column prop="skuDesc" label="描述" width="width" align="center"></el-table-column>
			<el-table-column label="默认图片" width="110" align="center">
				<template slot-scope="{row,$index}">
					<img :src="row.skuDefaultImg" style="width: 80px;height: 80px;">
				</template>
			</el-table-column>
			<el-table-column prop="weight" label="重量" width="80" align="center"></el-table-column>
			<el-table-column prop="price" label="价格" width="80" align="center"></el-table-column>
			<el-table-column label="操作" width="width" align="center">
				<template slot-scope="{row,$index}">
					<el-button @click="changesale(row)" v-if="row.isSale==0" size="mini" icon="el-icon-sort-down"
						type="success"></el-button>
					<el-button @click="changesale(row)" v-if="row.isSale==1" size="mini" icon="el-icon-sort-up"
						type="info"></el-button>
					<el-button @click="info" size="mini" icon="el-icon-edit" type="primary"></el-button>
					<el-button @click="getinfo(row)" size="mini" icon="el-icon-info" type="info"></el-button>
					<el-button size="mini" icon="el-icon-delete" type="danger"></el-button>
				</template>
			</el-table-column>
		</el-table>
		<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" style="text-align: center;"
			:current-page="page" :page-sizes="[3, 5, 10]" :page-size="limit"
			layout="prev, pager, next, jumper,->, sizes,total" :total="total">
		</el-pagination>
		<el-drawer size="50%" :visible.sync="drawer" :show-close="false">
			<el-row>
				<el-col :span="5">名称</el-col>
				<el-col :span="16">{{skuinfo.skuName}}</el-col>
			</el-row>
			<el-row>
				<el-col :span="5">描述</el-col>
				<el-col :span="16">{{skuinfo.skuDesc}}</el-col>
			</el-row>
			<el-row>
				<el-col :span="5">价格</el-col>
				<el-col :span="16">{{skuinfo.price}}元</el-col>
			</el-row>
			<el-row>
				<el-col :span="5">平台属性</el-col>
				<el-col :span="16">
					<template>
						<el-tag style="margin-right: 10px;" type="success" v-for="(a,index) in skuinfo.skuAttrValueList" :key="a.id">{{a.attrId}}-{{a.valueId}}</el-tag>
					</template>
				</el-col>
			</el-row>
			<el-row>
				<el-col :span="5">图片</el-col>
				<el-col :span="16">
					<el-carousel height="150px">
					      <el-carousel-item v-for="item in skuinfo.skuImageList" :key="item.id">
					        <img :src="item.imgUrl" >
					      </el-carousel-item>
					</el-carousel>
				</el-col>
			</el-row>
		</el-drawer>
	</div>
</template>

<script>
	export default {
		name: 'sku',
		data() {
			return {
				page: 1,
				limit: 10,
				total: 0,
				skulist: [],
				skuinfo: {},
				drawer: false
			}
		},
		mounted() {
			this.getskulist()
		},
		methods: {
			async getinfo(row) {
				let res = await this.$API.sku.reqgetSkuById(row.id)
				if (res.code == 200) {
					this.skuinfo = res.data
				}
				this.drawer = true
			},
			info() {
				this.$message('正在开发中')
			},
			async changesale(row) {
				if (row.isSale == 0) {
					row.isSale = 1
					let res = await this.$API.sku.reqonSale(row.id)
					if (res.code == 200) {
						this.$message({
							type: 'success',
							message: '上架成功'
						})
					}
				} else {
					row.isSale = 0
					let res = await this.$API.sku.reqcancelSale(row.id)
					if (res.code == 200) {
						this.$message({
							type: 'success',
							message: '下架成功'
						})
					}
				}

			},
			async getskulist() {
				let res = await this.$API.sku.reqskulist(this.page, this.limit)
				if (res.code == 200) {
					this.skulist = res.data.records
					this.total = res.data.total
				}
			},
			handleSizeChange(limit) {
				this.limit = limit
				this.getskulist()
			},
			handleCurrentChange(page) {
				this.page = page
				this.getskulist()
			},
		}
	}
</script>

<style scoped>
	.el-carousel__button{
		width: 10px;
		height: 10px;
	}
	  .el-carousel__item h3 {
	    color: #475669;
	    font-size: 14px;
	    opacity: 0.75;
	    line-height: 150px;
	    margin: 0;
	  }
	
	  .el-carousel__item:nth-child(2n) {
	     background-color: #99a9bf;
	  }
	  
	  .el-carousel__item:nth-child(2n+1) {
	     background-color: #d3dce6;
	  }
	.el-row .el-col-5 {
		font-size: 18px;
		text-align: right;
	}

	.el-col {
		margin: 10px 10px;
	}
</style>
