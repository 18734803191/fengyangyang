import request from '@/utils/request'
// 获取品牌列表信息
export const reqtrademarklist=(page,limt)=>{
  return request({
    url: `admin/product/baseTrademark/${page}/${limt}`,
    method: 'get',
  })
}
// 添加、修改品牌信息
export const addorupdatatrademarklist=(trademark)=>{
  if(!trademark.id){
	  return request({
	    url: `admin/product/baseTrademark/save`,
	    method: 'post',
		data:trademark
	  })
  }else{
	  return request({
	    url: `admin/product/baseTrademark/update`,
	    method: 'put',
		data:trademark
	  })
  }
}
// 删除品牌信息
export const deletetrademarklist=(id)=>{
 return request({
   url: `/admin/product/baseTrademark/remove/${id}`,
   method: 'delete'
 })
}