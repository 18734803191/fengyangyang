import request from '@/utils/request'
// 获取三级联动信息
// 一级分类接口
export const reqspuImageList = (id) => {
	return request({
		url: `/admin/product/spuImageList/${id}`,
		method: 'get',
	})
}
export const reqspuSaleAttrList = (id) => {
	return request({
		url: `/admin/product/spuSaleAttrList/${id}`,
		method: 'get',
	})
}
export const reqattrInfoList = (category1Id, category2Id, category3Id) => {
	return request({
		url: `/admin/product/attrInfoList/${category1Id}/${category2Id}/${category3Id}`,
		method: 'get',
	})
}
export const reqsaveSkuInfo = (skuinfo) => {
	return request({
		url: `/admin/product/saveSkuInfo`,
		method: 'post',
		data: skuinfo
	})
}
// POST /admin/product/saveSkuInfoGET /admin/product/findBySpuId/{spuId}
export const reqfindBySpuId = (spuId) => {
	return request({
		url: `/admin/product/findBySpuId/${spuId}`,
		method: 'get'
	})
}
export const reqskulist = (page, limit) => {
	return request({
		url: `/admin/product/list/${page}/${limit}`,
		method: 'get'
	})
}
export const reqonSale = (id) => {
	return request({
		url: `/admin/product/onSale/${id}`,
		method: 'get'
	})
}
export const reqcancelSale = (id) => {
	return request({
		url: `/admin/product/cancelSale/${id}`,
		method: 'get'
	})
}
// GET /admin/product/getSkuById/{skuId}
export const reqgetSkuById = (id) => {
	return request({
		url: `/admin/product/getSkuById/${id}`,
		method: 'get'
	})
}