<template>
	<div>
		<!-- 添加按钮 -->
		<el-button @click="handle" type="primary" icon="el-icon-plus">添加</el-button>
		<!-- 展示品牌的表格 -->
		<el-table border style="width: 100%" :data="list">
			<el-table-column type="index" prop="date" label="序号" width="80" align="center">

			</el-table-column>
			<el-table-column prop="tmName" label="品牌名称" width="width">

			</el-table-column>
			<el-table-column prop="logoUrl" label="品牌logo" width="width">
				<template slot-scope="{row,$index}">
					<img :src="row.logoUrl" style="width: 50px;height: 50px;">
				</template>
			</el-table-column>
			<el-table-column prop="prop" label="操作" width="width">
				<template slot-scope="{row,$index}">
					<el-button @click="changetrademark(row)" type="warning" icon="el-icon-edit" size="mini">修改
					</el-button>
					<el-button @click="deletetrademark(row)" type="danger" icon="el-icon-delete" size="mini">删除</el-button>
				</template>
			</el-table-column>
		</el-table>
		<!-- 分页器 -->
		<el-pagination style="margin-top: 20px;text-align: center;" @current-change="handleCurrentChange"
			@size-change="handleSizeChange" :total="total" :page-size="3" :page-sizes="[3,5,10]" :current-page="page"
			layout="prev, pager, next, jumper, ->,sizes,total">
		</el-pagination>
		<!-- 弹出框 -->
		<el-dialog :title="!tmForm.id?'添加品牌':'修改品牌'" :visible.sync="dialogFormVisible">
			<el-form :model="tmForm" :rules="rules" ref="ruleForm">
				<el-form-item label="品牌名称" label-width="100px" prop="tmName">
					<el-input v-model="tmForm.tmName" autocomplete="off"></el-input>
				</el-form-item>
				<el-form-item label="品牌logo" label-width="100px" prop="logoregion">
					<el-upload class="avatar-uploader" action="dev-api/admin/product/fileUpload" :show-file-list="false"
						:on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
						<img v-if="tmForm.logoUrl" :src="tmForm.logoUrl" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
						<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
					</el-upload>
				</el-form-item>
			</el-form>
			<div slot="footer" class="dialog-footer">
				<el-button @click="dialogFormVisible=false">取 消</el-button>
				<el-button type="primary" @click="addorupdatatrademark">确 定</el-button>
			</div>
		</el-dialog>
	</div>
</template>

<script>
	export default {
		name: 'trademark',
		data() {
			return {
				page: 1,
				limt: 3,
				total: 0,
				list: [],
				dialogFormVisible: false,
				tmForm: {
					tmName: '',
					logoUrl: ''
				},
				rules: {
					tmName: [{
							required: true,
							message: '请输入品牌名称',
							trigger: 'blur'
						},
						{
							min: 1,
							max: 3,
							message: '长度在 1 到 3 个字符',
							trigger: 'change'
						}
					],
					logoregion: [{
						// required: true,
						message: '请选择品牌图片',
					}],
				}
			}
		},
		mounted() {
			this.getlist()
		},
		methods: {
			deletetrademark(row){
				        this.$confirm(`确定删除${row.tmName}?`, '提示', {
				          confirmButtonText: '确定',
				          cancelButtonText: '取消',
				          type: 'warning'
				        }).then(async () => {
				          let res = await this.$API.trademark.deletetrademarklist(row.id)
						  if(res.code==200){
							  this.$message({
							    type: 'success',
							    message: '删除成功!'
							  });
							  
							  this.getlist(this.list.length>1?this.page:this.page-1)
						  }
				        }).catch(() => {
				          this.$message({
				            type: 'info',
				            message: '已取消删除'
				          });          
				        });
			},
			addorupdatatrademark() {
				this.$refs.ruleForm.validate(async (valid) => {
					if (valid) {
						this.dialogFormVisible = false
						let res = await this.$API.trademark.addorupdatatrademarklist(this.tmForm)
						if (res.code == 200) {
							this.$message({
								type: 'success',
								message: this.tmForm.id ? '修改品牌成功' : '添加品牌成功'
							})
							this.getlist()
						}
					} else {
						console.log('error submit!!');
						return false;
					}
				});

			},
			async getlist(a) {
				const {
					page,
					limt
				} = this
				let res = await this.$API.trademark.reqtrademarklist(a?a:page, limt)
				if (res.code == 200) {
					this.total = res.data.total
					this.list = res.data.records
				}
			},
			handleCurrentChange(pager) {
				this.page = pager
				this.getlist()
			},
			handleSizeChange(limt) {
				this.limt = limt
				this.getlist()
			},
			handle() {
				this.dialogFormVisible = true
				this.tmForm = {
					tmName: '',
					logoUrl: ''
				}
			},
			changetrademark(row) {
				this.dialogFormVisible = true
				this.tmForm = {
					...row
				}
			},
			handleAvatarSuccess(res, file) {
				this.tmForm.logoUrl = res.data
			},
			beforeAvatarUpload(file) {
				const isJPG = file.type === 'image/jpeg';
				const isLt2M = file.size / 1024 / 1024 < 2;

				if (!isJPG) {
					this.$message.error('上传头像图片只能是 JPG 格式!');
				}
				if (!isLt2M) {
					this.$message.error('上传头像图片大小不能超过 2MB!');
				}
				return isJPG && isLt2M;
			}
		}
	}
</script>

<style scoped>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
