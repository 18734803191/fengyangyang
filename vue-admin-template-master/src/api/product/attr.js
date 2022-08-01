import request from '@/utils/request'
// 获取三级联动信息
// 一级分类接口
export const reqcategorylist=()=>{
  return request({
    url: `/admin/product/getCategory1`,
    method: 'get',
  })
}
// 二级分类接口
export const reqcategorylist2=(category1Id)=>{
  return request({
    url: `/admin/product/getCategory2/${category1Id}`,
    method: 'get',
  })
}
// 三级分类接口
export const reqcategorylist3=(category2Id)=>{
  return request({
    url: `/admin/product/getCategory3/${category2Id}`,
    method: 'get',
  })
}
// 获取商品属性列表
export const reqattrlist=(category1Id,category2Id,category3Id)=>{
  return request({
    url: `/admin/product/attrInfoList/${category1Id}/${category2Id}/${category3Id}`,
    method: 'get',
  })
}
// 添加属性
export const reqattrinfo=(data)=>{
  return request({
    url: `/admin/product/saveAttrInfo`,
    method: 'post',
	data
  })
}