<template>
	<div>
		<el-form ref="form" label-width="80px" :model="spu">
			<el-form-item label="spu名称">
				<el-input placeholder="spu名称" v-model="spu.spuName"></el-input>
			</el-form-item>
			<el-form-item label="品牌">
				<el-select value="" placeholder="请选择品牌" v-model="spu.tmId">
					<el-option :label="item.tmName" :value="item.id" v-for="(item,index) in trademarkList" :key="item.id"></el-option>
				</el-select>
			</el-form-item>
			<el-form-item label="spu描述">
				<el-input type="textarea" rows="4" placeholder="描述" v-model="spu.description"></el-input>
			</el-form-item>
			<el-form-item label="图片展示">
				<el-upload 
					action="dev-api/admin/product/fileUpload" 
					list-type="picture-card"
					:on-preview="handlePictureCardPreview" 
					:on-success="handlesuccess"
					:file-list="imglist"
					:on-remove="handleRemove">
					<i class="el-icon-plus"></i>
				</el-upload>
				<el-dialog :visible.sync="dialogVisible">
					<img width="100%" :src="dialogImageUrl" alt="">
				</el-dialog>
			</el-form-item>

			<el-form-item label="销售属性">
				<el-select value="" :placeholder="`还有${unselect.length}未选择`" v-model="attrid">
					<el-option :label="a.name" :value="`${a.id}:${a.name}`" v-for="(a,index) in unselect"></el-option>
				</el-select>
				<el-button @click="addsave" type="primary" icon="el-icon-plus" :disabled="!attrid">添加销售属性</el-button>
				<el-table border style="width: 100%" :data="spu.spuSaleAttrList">
					<el-table-column type="index" label="序号" width="80" align="center">
					</el-table-column>
					<el-table-column prop="saleAttrName" label="属性名" width="width">
					</el-table-column>
					<el-table-column prop="description" label="属性值名称列表" width="width">
						<template slot-scope="{row,$index}">
							<el-tag @close="handleClose(row,index)" :key="tag.id" v-for="(tag,index) in row.spuSaleAttrValueList" closable :disable-transitions="false">
							  {{tag.saleAttrValueName}}
							</el-tag>
							<el-input
							  class="input-new-tag"
							  v-if="row.inputVisible"
							  v-model="row.inputValue"
							  ref="saveTagInput"
							  size="small"
							  @blur="totag(row)"
							>
							</el-input>
							<el-button v-else class="button-new-tag" size="small" @click="addattr(row)">添加</el-button>
						</template>
					</el-table-column>
					<el-table-column prop="description" label="操作" width="width">
						<template slot-scope="{row,$index}">
							<el-button @click="deletesale(row,$index)" type="danger" icon="el-icon-delete" size="mini"></el-button>
						</template>
					</el-table-column>
				</el-table>
			</el-form-item>
			<el-form-item>
				<el-button type="primary" @click="saveinfo">保存</el-button>
				<el-button @click="$emit('changescene',0)">取消</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
	export default {
		name: 'spuform',
		data() {
			return {
				attrid:'',
				dialogImageUrl: '',
				dialogVisible: false,
				spu: {
					"category3Id": 0,
					"description": "",
					"tmId": 0,
					"spuImageList": [{
						"id": 0,
						"imgName": "",
						"imgUrl": "",
						"spuId": 0
					}],
					"spuName": "",
					"spuSaleAttrList": [{
						"baseSaleAttrId": 0,
						"id": 0,
						"saleAttrName": "",
						"spuId": 0,
						"spuSaleAttrValueList": [{
							"baseSaleAttrId": 0,
							"id": 0,
							"isChecked": "",
							"saleAttrName": "",
							"saleAttrValueName": "",
							"spuId": 0
						}]
					}]
				},
				trademarkList: [],
				imglist: [],
				salelist: []
			}
		},
		computed:{
			
			unselect(){
				let arr=this.salelist.filter(a=>{
					return this.spu.spuSaleAttrList.every(b=>{
						return a.name!=b.saleAttrName
					})
				})
				return arr
			}
		},
		methods: {
			async saveinfo(){
				this.spu.spuImageList=this.imglist.map(a=>{
					return {imageName:a.name,imageUrl:(a.response&&a.response.data)||a.url}
				})
				let res = await this.$API.spu.reqspuinfo(this.spu)
				if (res.code == 200) {
					this.$message({type:'success',message:'保存成功'})
					if(this.spu.id){
						this.$emit('changescene',0)
					}else{
						this.$emit('changescene',1)
					}
				}
			},
			deletesale(row,index){
				this.spu.spuSaleAttrList.splice(index,1)
				// console.log(row)
			},
			handleClose(row,index){
				row.spuSaleAttrValueList.splice(index,1)
			},
			totag(row){
				if(row.inputValue.trim()==''){
					this.$message('不能为空')
					return
				}
				let b = row.spuSaleAttrValueList.filter(a=>{
					return a.saleAttrValueName==row.inputValue
				})
				if(b.length){
					this.$message('不能重复')
					return
				}
				let newsale={
					baseSaleAttrId:row.baseSaleAttrId,
					saleAttrValueName:row.inputValue
				}
				row.spuSaleAttrValueList.push(newsale)
				row.inputVisible=false
			},
			addattr(row){
				this.$set(row,'inputVisible',true)
				this.$set(row,'inputValue','')
			},
			addsave(){
				let [baseSaleAttrId,saleAttrName]=this.attrid.split(':')
				let newsale={baseSaleAttrId,saleAttrName,spuSaleAttrValueList:[]}
				this.spu.spuSaleAttrList.push(newsale)
			},
			handlesuccess(response, file, fileList){
				this.imglist=fileList
			},
			handleRemove(file,a) {
			    this.imglist=a
			},
			handlePictureCardPreview(file) {
			    this.dialogImageUrl = file.url;
			    this.dialogVisible = true;
			},
			async initspu(row) {
				// 获取spu信息
				let res = await this.$API.spu.reqspuid(row.id)
				if (res.code == 200) {
					this.spu = res.data
				}
				// 获取spu品牌信息
				let res1 = await this.$API.spu.reqgetTrademarkList()
				if (res1.code == 200) {
					this.trademarkList = res1.data
				}
				// 获取spu图片信息
				let res2 = await this.$API.spu.reqspuImageList(row.id)
				if (res2.code == 200) {
					let imglist = res2.data
					imglist.forEach(a=>{
						a.name=a.imgName
						a.url=a.imgUrl
					})
					this.imglist=imglist
				}
				// 获取销售属性信息
				let res3 = await this.$API.spu.reqbaseSaleAttrList()
				if (res3.code == 200) {
					this.salelist = res3.data
				}
			},
			async adddata(category3Id) {
				this.spu.category3Id=category3Id
				// 获取spu品牌信息
				let res1 = await this.$API.spu.reqgetTrademarkList()
				if (res1.code == 200) {
					this.trademarkList = res1.data
				}
				// 获取销售属性信息
				let res3 = await this.$API.spu.reqbaseSaleAttrList()
				if (res3.code == 200) {
					this.salelist = res3.data
				}
			}
		}
	}
</script>

<style scoped>
	.el-tag + .el-tag {
	    margin-left: 10px;
	  }
	  .button-new-tag {
	    margin-left: 10px;
	    height: 32px;
	    line-height: 30px;
	    padding-top: 0;
	    padding-bottom: 0;
	  }
	  .input-new-tag {
	    width: 90px;
	    margin-left: 10px;
	    vertical-align: bottom;
	  }
</style>
