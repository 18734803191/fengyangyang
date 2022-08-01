<template>
	<div>
		<el-card>
			<category :show="scene!==0" @getcategoryid="getcategoryid"></category>
		</el-card>
		<el-card>
			<div v-show="scene==0">
				<el-button @click="tospuform" type="primary" icon="el-icon-plus" :disabled="!category3Id">添加spu
				</el-button>
				<el-table border style="width: 100%" :data="records">
					<el-table-column type="index" label="序号" width="80" align="center">
					</el-table-column>
					<el-table-column prop="spuName" label="spu名称" width="width">
					</el-table-column>
					<el-table-column prop="description" label="spu描述" width="width">
					</el-table-column>
					<el-table-column prop="prop" label="操作" width="width">
						<template slot-scope="{row,$index}">
							<mybutton @click="toskuform(row)" title="添加sku" type="success" icon="el-icon-plus" size="mini"></mybutton>
							<mybutton @click="updataspuform(row)" title="修改spu" type="warning" icon="el-icon-edit" size="mini"></mybutton>
							<mybutton @click="handle(row)" title="查看所有spu列表" type="info" icon="el-icon-info" size="mini"></mybutton>
							<el-popconfirm title="这是一段内容确定删除吗？" @onConfirm="deletespu(row)">
							<mybutton slot="reference" title="删除spu" type="danger" icon="el-icon-delete" size="mini"></mybutton>
							</el-popconfirm>
						</template>
					</el-table-column>
				</el-table>
				<!-- @size-change="handleSizeChange" -->
				<!-- @current-change="handleCurrentChange" -->
				<el-pagination
					@size-change="handleSizeChange"
					  @current-change="handleCurrentChange"
				      style="text-align: center;"
				      :current-page="page"
				      :page-sizes="[3, 5, 10]"
				      :page-size="limit"
				      layout="prev, pager, next, jumper,->, sizes,total"
				      :total="total">
				</el-pagination>
			</div>
			<spuform ref="spuform1" v-show="scene==1" @changescene="changescene"></spuform>
			<skuform ref="skuform1" v-show="scene==2" @changescens="changescens"></skuform>
		</el-card>
		<el-dialog :title="`${spu.spuName}的sku列表`" :visible.sync="dialogTableVisible">
		  <el-table :data="skulist" v-loading="loading" :before-close="close">
		    <el-table-column prop="skuName" label="名称" width="width"></el-table-column>
		    <el-table-column prop="price" label="价格" width="width"></el-table-column>
		    <el-table-column prop="weight" label="重量"></el-table-column>
		    <el-table-column label="默认图片">
				<template slot-scope="{row,$index}">
					<img :src="row.skuDefaultImg" style="width: 100px;height: 100px;">
					</template>
			</el-table-column>
		  </el-table>
		</el-dialog>

	</div>
</template>

<script>
	import skuform from './skuform.vue'
	import spuform from './spuform.vue'
	export default {
		name: 'spu',
		data(){
			return {
				category1Id:'',
				category2Id:'',
				category3Id:'',
				isshow:true,
				page:1,
				limit:3,
				records:[],
				total:0,
				scene:0,
				dialogTableVisible:false,
				spu:{},
				skulist:[],
				loading:true
			}
		},
		methods: {
			close(){
				this.loading=true
				this.skulist=[]
			},
			async handle(row){
				this.spu=row
				let res = await this.$API.sku.reqfindBySpuId(row.id)
				this.dialogTableVisible=true
				if (res.code == 200) {
					this.skulist=res.data
					this.loading=false
				}
				
			},
			toskuform(row){
				this.scene=2
				this.$refs.skuform1.initsku(this.category1Id,this.category2Id,row)
			},
			async deletespu(row){
				let res = await this.$API.spu.reqdeletespu(row.id)
				if (res.code == 200) {
					this.$message({type:'success',message:'保存成功'})
					this.getspulist(this.records.length>1?this.page:this.page-1)
				}
			},
			changescene(scene){
				this.scene=scene
				this.getspulist(this.page)
			},
			changescens(scene){
				this.scene=scene
				this.getspulist(this.page)
			},
			updataspuform(row){
				this.scene=1
				this.$refs.spuform1.initspu(row)
			},
			tospuform(row){
				this.scene=1
				this.$refs.spuform1.adddata(this.category3Id)
			},
			handleSizeChange(limit){
				this.limit=limit
				this.getspulist()
			},
			handleCurrentChange(page){
				this.page=page
				this.getspulist()
			},
			getcategoryid({category1Id,category2Id,category3Id}) {
				this.category1Id = category1Id
				this.category2Id = category2Id
				this.category3Id = category3Id
				this.getspulist()
			},
			async getspulist(){
				let res = await this.$API.spu.reqspulist(this.page, this.limit, this.category3Id)
				if (res.code == 200) {
					this.records = res.data.records
					this.total = res.data.total
				}
			}
		},
		components:{
			skuform,
			spuform
		}
	}
</script>

<style scoped>
	.el-card {
		margin: 20px 0;
	}
</style>
