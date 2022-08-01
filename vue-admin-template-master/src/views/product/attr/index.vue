<template>
	<div>
		<el-card class="box-card">
			<category :show="!isshow" @getcategoryid="getcategoryid"></category>
		</el-card>
		<el-card class="box-card">
			<div v-show="isshow">
				<el-button type="primary" icon="el-icon-plus" :disabled="!category3Id" @click="attr">添加属性
				</el-button>
				<el-table border style="width: 100%" :data="attrlist">
					<el-table-column type="index" label="序号" width="80" align="center">
					</el-table-column>
					<el-table-column prop="attrName" label="属性名称" width="width">
					</el-table-column>
					<el-table-column prop="date" label="属性值列表" width="width">
						<template slot-scope="{row,$index}">
							<el-tag type="success" v-for="(a,index) in row.attrValueList" :key="a.id"
								style="margin: 0 20px;">{{a.valueName}}</el-tag>
						</template>
					</el-table-column>
					<el-table-column prop="date" label="操作" width="width">
						<template slot-scope="{row,$index}">
							<el-button @click="updateattr(row)" type="warning" icon="el-icon-edit" size="mini">修改
							</el-button>
							<el-button @click="isshow=false" type="danger" icon="el-icon-delete" size="mini">删除
							</el-button>
						</template>
					</el-table-column>
				</el-table>

			</div>
			<div v-show="!isshow">
				<el-form :inline="true" label-width="80px">
					<el-form-item label="属性名">
						<el-input placeholder="请输入属性名" v-model="attrinfo.attrName">

						</el-input>
					</el-form-item>
				</el-form>
				<el-button :disabled="attrinfo.attrName?false:true" type="primary" icon="el-icon-plus" @click="addattrvalue">
					添加属性值
				</el-button>
				<el-button @click="isshow=true">
					取消
				</el-button>
				<el-table :data="attrinfo.attrValueList" border style="width: 100%;margin: 20px 0;">
					<el-table-column type="index" align="center" label="序号" width="80px">
					</el-table-column>
					<el-table-column prop="prop" label="属性值名称" width="width">
						<template slot-scope="{row,$index}">
							<el-input @keyup.native.enter="tolook(row)" @blur="tolook(row)" v-show="row.flag" placeholder="请输入属性值" v-model="row.valueName" :ref="$index"></el-input>
							<span style="display: block;" v-show="!row.flag" @click="toedit(row,$index)">{{row.valueName}}</span>
						</template>
					</el-table-column>
					<el-table-column prop="prop" label="操作" width="width">
						<template slot-scope="{row,$index}">		
							<el-popconfirm :title="`确定删除${row.valueName}吗？`" @onConfirm="deleteattr(row)">
							  <el-button slot="reference" type="danger" icon="el-icon-delete" size="mini">删除</el-button>
							</el-popconfirm>
						</template>
					</el-table-column>
				</el-table>
				<el-button :disabled="attrinfo.attrValueList.length<1" type="primary" @click="addorupdateattr">保存</el-button>
				<el-button @click="isshow=true">取消</el-button>
			</div>
		</el-card>
	</div>
</template>

<script>
	import cloneDeep from 'lodash/cloneDeep'
	export default {
		name: 'attr',
		data() {
			return {
				category1Id: '',
				category2Id: '',
				category3Id: '',
				attrlist: [],
				isshow: true,
				attrinfo: {
					attrName: "",
					attrValueList: [],
					categoryId: 0,
					categoryLevel: 3
				}
			}
		},
		methods: {
			async addorupdateattr(){
				this.attrinfo.attrValueList=this.attrinfo.attrValueList.filter((a)=>{
					if(a.valueName!=''){
						delete a.flag
						return true
					}
				})
				try{
					await this.$API.attr.reqattrinfo(this.attrinfo)
					this.$message({type:'success',message:'保存成功'})
					this.getattrlist()
					this.isshow=true
				}catch{
					this.$message('失败')
				}
			},
			deleteattr(row){
				this.attrinfo.attrValueList=this.attrinfo.attrValueList.filter((a)=>{
					return a.valueName!==row.valueName
				})
			},
			toedit(row,$index){
				row.flag=true
				this.$nextTick(()=>{
					this.$refs[$index].focus()
				})
			},
			tolook(row){
				if(row.valueName.trim()==''){
					this.$message('不能输入为空！')
					return
				}else if(this.attrinfo.attrValueList.some((a)=>{
					if(row!=a){
						return row.valueName == a.valueName
					}
				})){
					this.$message('不能重复输入！')
					return
				}
				row.flag=false
			},
			updateattr(row){
				this.isshow=false
				this.attrinfo=cloneDeep(row)
				this.attrinfo.attrValueList.forEach(a=>{
					this.$set(a,'flag',false)
				})
			},
			attr(){
				this.isshow=false
				this.attrinfo={
					attrName: "",
					attrValueList: [],
					categoryId: this.category3Id,
					categoryLevel: 3
				}
			},
			addattrvalue(){
				this.attrinfo.attrValueList.push({
						attrId: this.attrinfo.id||undefined,
						valueName: "",
						flag: true
					})
					this.$nextTick(()=>{
						this.$refs[this.attrinfo.attrValueList.length-1].focus()
					})
			},
			getcategoryid({
				category1Id,
				category2Id,
				category3Id}) {
				this.category1Id = category1Id
				this.category2Id = category2Id
				this.category3Id = category3Id
				this.getattrlist()
			},
			async getattrlist() {
				let res = await this.$API.attr.reqattrlist(this.category1Id, this.category2Id, this.category3Id)
				if (res.code == 200) {
					this.attrlist = res.data
				}
			}
		}
	}
</script>

<style scoped>
	.el-card {
		margin-bottom: 20px;
	}
</style>
