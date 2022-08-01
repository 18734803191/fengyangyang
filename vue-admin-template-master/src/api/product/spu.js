import request from '@/utils/request'
// 获取三级联动信息
// 一级分类接口
export const reqspulist=(page,limit,category3Id)=>{
  return request({
    url: `/admin/product/${page}/${limit}`,
    method: 'get',
	params:{category3Id}
  })
}
export const reqspuid=(spuId)=>{
  return request({
    url: `/admin/product/getSpuById/${spuId}`,
    method: 'get'
  })
}
export const reqgetTrademarkList=()=>{
  return request({
    url: `/admin/product/baseTrademark/getTrademarkList`,
    method: 'get'
  })
}
export const reqspuImageList=(spuId)=>{
  return request({
    url: `/admin/product/spuImageList/${spuId}`,
    method: 'get'
  })
}
export const reqbaseSaleAttrList=()=>{
  return request({
    url: `/admin/product/baseSaleAttrList`,
    method: 'get'
  })
}
export const reqspuinfo=(spuinfo)=>{
  if(spuinfo.id){
		return request({
		  url: `/admin/product/updateSpuInfo`,
		  method: 'post',
		  data:spuinfo
		})
	}else{
		return request({
		  url: `/admin/product/saveSpuInfo`,
		  method: 'post',
		  data:spuinfo
		})
	}
}
export const reqdeletespu=(spuId)=>{
  return request({
    url: `/admin/product/deleteSpu/${spuId}`,
    method: 'delete'
  })
}
