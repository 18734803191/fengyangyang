<template>
	<div>
		<el-form ref="form" label-width="80px">
			<el-form-item label="spu名称">
				<span>{{spu.spuName}}</span>
			</el-form-item>
			<el-form-item label="sku名称">
				<el-input placeholder="spu名称" v-model="saveinfo.skuName"></el-input>
			</el-form-item>
			<el-form-item label="价格(元)">
				<el-input type="number" placeholder="价格(元)" v-model="saveinfo.price"></el-input>
			</el-form-item>
			<el-form-item label="重量(千克)">
				<el-input placeholder="重量(千克)" v-model="saveinfo.weight"></el-input>
			</el-form-item>
			<el-form-item label="规格描述">
				<el-input type="textarea" rows="4" placeholder="规格描述" v-model="saveinfo.skuDesc"></el-input>
			</el-form-item>
			<el-form-item label="平台属性">
				<el-form ref="form" label-width="80px">
					<el-form-item :label="item.attrName" v-for="(item,index) in attrInfoList" :key="item.id">
						<el-select v-model="item.idandvalue" placeholder="请选择">
							<el-option :label="item1.valueName" :value="`${item.id}:${item1.id}`" v-for="(item1,index1) in item.attrValueList" :key="item1.id"></el-option>
						</el-select>
					</el-form-item>
				</el-form>
			</el-form-item>
			<el-form-item label="销售属性">
				<el-form ref="form" label-width="80px">
					<el-form-item :label="item2.saleAttrName" v-for="(item2,index) in spuSaleAttrList" :key="item2.id">
						<el-select placeholder="请选择" v-model="item2.saleidandvalue">
							<el-option :label="item3.saleAttrValueName" :value="`${item2.id}:${item3.id}`" v-for="(item3,index1) in item2.spuSaleAttrValueList" :key="item3.id"></el-option>
						</el-select>
					</el-form-item>
				</el-form>
			</el-form-item>
			<el-form-item label="图片列表">
				<el-table @selection-change="handleSelectionChange" border style="width: 100%" :data="spuImageList">
					<el-table-column type="selection" label="序号" width="80" align="center">
					</el-table-column>
					<el-table-column label="图片" width="width" align="center">
						<template slot-scope="{row,$index}">
							<img :src="row.imgUrl" style="width: 100px;height: 100px;">
						</template>
					</el-table-column>
					<el-table-column prop="imgName" label="名称" width="width" align="center">
					</el-table-column>
					<el-table-column label="操作" width="width" align="center">
						<template slot-scope="{row,$index}">
							<el-button @click="tomoren(row)" v-if="row.isDefault==0" type="primary">设置默认</el-button>
							<el-button @click="toshezhi(row)" v-else>默认</el-button>
						</template>
					</el-table-column>
				</el-table>
			</el-form-item>
			<el-form-item>
				<el-button @click="save" type="primary">保存</el-button>
				<el-button @click="$emit('changescens',0)">取消</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
	export default {
		name: 'skuform',
		data() {
			return {
				spuImageList: [],
				spuSaleAttrList: [],
				attrInfoList: [],
				saveinfo: {
					"category3Id": 0,
					"price": 0,
					"spuId": 0,
					"tmId": 0,
					"skuAttrValueList": [{
						"attrId": 0,
						"attrName": "string",
						"id": 0,
						"skuId": 0,
						"valueId": 0,
						"valueName": "string"
					}],
					"skuDefaultImg": "",
					"skuDesc": "",
					"skuImageList": [{
						"id": 0,
						"imgName": "",
						"imgUrl": "",
						"isDefault": "",
						"skuId": 0,
						"spuImgId": 0
					}],
					"skuName": "",
					"skuSaleAttrValueList": [{
						"id": 0,
						"saleAttrId": 0,
						"saleAttrName": "",
						"saleAttrValueId": 0,
						"saleAttrValueName": "",
						"skuId": 0,
						"spuId": 0
					}],
					"weight": ""
				},
				spu: {}
			}
		},
		methods: {
			async save(){
				this.saveinfo.skuAttrValueList = this.attrInfoList.reduce((prev,item)=>{
					if(item.idandvalue){
						const [attrid,valueid] = item.idandvalue.split(':')
						prev.push({attrid,valueid})
					}
					return prev
				},[])
				this.saveinfo.spuSaleAttrList = this.spuSaleAttrList.reduce((prev,item)=>{
					if(item.saleidandvalue){
						const [saleattrid,salevalueid] = item.saleidandvalue.split(':')
						prev.push({saleattrid,salevalueid})
					}
					return prev
				},[])
				this.saveinfo.spuImageList=this.spuImageList.map(a=>{
					return {
						imgName:a.imgName,
						imgUrl:a.imgUrl,
						isDefault:a.isDefault,
						spuImgId:a.id
					}
				})
				let res = await this.$API.sku.reqsaveSkuInfo(this.saveinfo)
				// if (res.code == 200) {
				// 	let list = res.data
				// 	list.forEach(a=>{
				// 		a.isDefault=0
				// 	})
				// 	this.spuImageList=list
				// }
				console.log(res)
			},
			tomoren(row){
				this.spuImageList.forEach(a=>{
					a.isDefault=0
				})
				row.isDefault=1
			},
			toshezhi(row){
				// let b=this.spuImageList.every(a=>{
				// 	return a.isDefault=1
				// })
				// console.log(b)
				this.spuImageList.forEach(a=>{
					a.isDefault=0
				})
				row.isDefault=0
			},
			handleSelectionChange(){
				
			},
			async initsku(category1Id, category2Id, row) {
				this.saveinfo.category3Id = row.category3Id
				this.saveinfo.spuId = row.id
				this.saveinfo.tmId = row.tmId
				this.spu = row
				let res = await this.$API.sku.reqspuImageList(row.id)
				if (res.code == 200) {
					let list = res.data
					list.forEach(a=>{
						a.isDefault=0
					})
					this.spuImageList=list
				}
				let res1 = await this.$API.sku.reqspuSaleAttrList(row.id)
				if (res1.code == 200) {
					this.spuSaleAttrList = res1.data
				}
				let res2 = await this.$API.sku.reqattrInfoList(category1Id, category2Id, row.category3Id)
				if (res2.code == 200) {
					this.attrInfoList = res2.data
				}
			}
		}
	}
</script>

<style>
</style>
