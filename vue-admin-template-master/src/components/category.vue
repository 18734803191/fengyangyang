<template>
	<div>
		<el-form :inline="true" class="demo-form-inline">
			<el-form-item label="一级分类">
				<el-select :disabled="show" placeholder="请选择" v-model="categoryform.category1Id" @change="handle1">
					<el-option :label="a.name" :value="a.id" v-for="(a,index) in list1" :key="a.id"></el-option>
				</el-select>
			</el-form-item>
			<el-form-item label="二级分类">
				<el-select :disabled="show" placeholder="请选择" v-model="categoryform.category2Id" @change="handle2">
						<el-option :label="b.name" :value="b.id" v-for="(b,index) in list2" :key="b.id"></el-option>
				</el-select>
			</el-form-item>
			<el-form-item label="三级分类">
				<el-select :disabled="show" placeholder="请选择" v-model="categoryform.category3Id" @change="handle3">
					<el-option :label="c.name" :value="c.id" v-for="(c,index) in list3" :key="c.id"></el-option>
				</el-select>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
	export default {
		name: 'category',
		props:['show'],
		data(){
			return{
				list1:[],
				list2:[],
				list3:[],
				categoryform:{
					category1Id:'',
					category2Id:'',
					category3Id:'',
				}
			}
		},
		mounted() {
			this.getcategorylist()
		},
		methods: {
			async getcategorylist() {
				let res=await this.$API.attr.reqcategorylist()
				if(res.code==200){
					this.list1=res.data
				}
			},
			async handle1(){
				this.categoryform.category2Id=''
				this.categoryform.category3Id=''
				this.list2=[]
				this.list3=[]
				let res=await this.$API.attr.reqcategorylist2(this.categoryform.category1Id)
				if(res.code==200){
					this.list2=res.data
				}
			},
			async handle2(){
				this.categoryform.category3Id=''
				this.list3=[]
				let res=await this.$API.attr.reqcategorylist3(this.categoryform.category2Id)
				if(res.code==200){
					this.list3=res.data
				}
			},
			handle3(){
				this.$emit('getcategoryid',{category1Id:this.categoryform.category1Id,category2Id:this.categoryform.category2Id,category3Id:this.categoryform.category3Id})
			}
		}
	}
</script>

<style>
</style>
