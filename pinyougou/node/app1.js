var express = require('express')
var app = express()
var request = require('request')
var path = require('path')
var bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({
	extended: false
})); // 值为false就用querystring方法处理格式
app.all('*', function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers",
		"Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
	res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
	res.header("X-Powered-By", ' 3.2.1')
	if (req.method == "OPTIONS") res.send(200); /*让options请求快速返回*/
	else next();
});
app.get('/getlist', (req, res) => {
	res.send({
		data: {
			list: [{
				id: 1,
				msg: '手机'
			}, {
				id: 2,
				msg: '家用电器'
			}, {
				id: 3,
				msg: '数码'
			}, {
				id: 4,
				msg: '家居服装'
			}, {
				id: 5,
				msg: '电脑办公'
			}, {
				id: 6,
				msg: '厨具'
			}, {
				id: 7,
				msg: '个护化妆'
			}, {
				id: 8,
				msg: '钟表'
			}, {
				id: 9,
				msg: '鞋帽'
			}, {
				id: 10,
				msg: '母婴'
			}, {
				id: 11,
				msg: '珠宝'
			}, {
				id: 12,
				msg: '汽车用品'
			}, {
				id: 13,
				msg: '服饰内衣'
			}, {
				id: 14,
				msg: '电子书刊'
			}, {
				id: 15,
				msg: '饮品保健品'
			}]
		},
		meta: {
			msg: '登录成功',
			status: 200
		}
	})
})
app.get('/getbannerlist', (req, res) => {
	res.send({
		data: {
			list: [{
				"id": "1",
				"imgUrl": "/images/focus.jpg"
			}, {
				"id": "2",
				"imgUrl": "/images/pic.jpg"
			}, {
				"id": "3",
				"imgUrl": "/images/focus.jpg"
			}, {
				"id": "4",
				"imgUrl": "/images/pic.jpg"
			}]
		},
		meta: {
			msg: '登录成功',
			status: 200
		}
	})
})
app.get('/getfloorlist', (req, res) => {
	res.send({
		data: {
			list: [{
				"id": "1",
				"name": "家用电器",
				"keywords": [
					"节能补贴",
					"4k电视",
					"空气净化器",
					"洗衣机",
					"热水器",
					"冰箱"
				],
				"imgurl": "./images/floor-1-1.png",
				"navlist": [{
					url: '#',
					text: '热门'
				}, {
					url: '#',
					text: '大家电'
				}, {
					url: '#',
					text: '生活'
				}, {
					url: '#',
					text: '日用'
				}, {
					url: '#',
					text: '百货'
				}, {
					url: '#',
					text: '百货'
				}],
				"carouselist": [{
					id: "0011",
					imgurl: './images/pic.jpg'
				}, {
					id: "0012",
					imgurl: './images/pic.jpg'
				}, {
					id: "0013",
					imgurl: './images/pic.jpg'
				}]
			}, {
				"id": "2",
				"name": "家用电器",
				"keywords": [
					"节能补贴",
					"4k电视",
					"空气净化器",
					"洗衣机",
					"热水器",
					"冰箱"
				],
				"imgurl": "./images/floor-1-1.png",
				"navlist": [{
					url: '#',
					text: '热门'
				}, {
					url: '#',
					text: '大家电'
				}, {
					url: '#',
					text: '生活'
				}, {
					url: '#',
					text: '日用'
				}, {
					url: '#',
					text: '百货'
				}],
				"carouselist": [{
					id: "0011",
					imgurl: './images/pic.jpg'
				}, {
					id: "0012",
					imgurl: './images/pic.jpg'
				}, {
					id: "0013",
					imgurl: './images/pic.jpg'
				}]
			}]
		},
		meta: {
			msg: '登录成功',
			status: 200
		}
	})
})
app.post('/getsearchlist', (req, res) => {
	res.send({
		data: {
			"trademarkList": [{
				"tmId": 1,
				"tmName": "苹果"
			}, {
				"tmId": 2,
				"tmName": "索尼"
			}, {
				"tmId": 3,
				"tmName": "小米"
			}, {
				"tmId": 4,
				"tmName": "三星"
			}, {
				"tmId": 5,
				"tmName": "oppo"
			}],
			"attrsList": [{
				"attrId": 1,
				"attrValueList": [
					"GSM（移动/联通2G）",
					"电信2G",
					'电信3G',
					'移动3G',
					'联通3G',
					'联通4G',
					'电信3G',
					'电信3G',
					'电信3G',
				],
				"attrName": "网络格式"
			}, {
				"attrId": 2,
				"attrValueList": [
					"4.0-4.9英寸",
					"4.0-4.9英寸"
				],
				"attrName": "显示屏尺寸"
			}, {
				"attrId": 3,
				"attrValueList": [
					"1200万以上",
					"800-1199万",
					"1200-1599万",
					"1600万以上",
					"无摄像头"
				],
				"attrName": "摄像头像素"
			}, {
				"attrId": 4,
				"attrValueList": [
					"4500-11999",
					"2800-4499"
				],
				"attrName": "价格"
			}, {
				"attrId": 5,
				"attrValueList": [
					"特点",
					"系统",
					"手机内存",
					"单卡双卡",
					"系统",
					"其他"
				],
				"attrName": "更多筛选项"
			}],
			"goodsList": [{
				"id": 1,
				"defaultImg": "./images/mobile03.jpg",
				"title": "Apple iPhone 11 (A2223)",
				"price": 5499,
				"createTime": null,
				"tmId": null,
				"tmName": null,
				"category1Id": null,
				"category1Name": null,
				"category2Id": null,
				"category2Name": null,
				"category3Id": null,
				"category3Name": null,
				"hotScore": 0,
				"attrs": null
			}, {
				"id": 2,
				"defaultImg": "./images/mobile03.jpg",
				"title": "Apple iPhone 11 (A2223)",
				"price": 5499,
				"createTime": null,
				"tmId": null,
				"tmName": null,
				"category1Id": null,
				"category1Name": null,
				"category2Id": null,
				"category2Name": null,
				"category3Id": null,
				"category3Name": null,
				"hotScore": 0,
				"attrs": null
			}, {
				"id": 3,
				"defaultImg": "./images/mobile03.jpg",
				"title": "Apple iPhone 11 (A2223)",
				"price": 5499,
				"createTime": null,
				"tmId": null,
				"tmName": null,
				"category1Id": null,
				"category1Name": null,
				"category2Id": null,
				"category2Name": null,
				"category3Id": null,
				"category3Name": null,
				"hotScore": 0,
				"attrs": null
			}, {
				"id": 4,
				"defaultImg": "./images/mobile03.jpg",
				"title": "Apple iPhone 11 (A2223)",
				"price": 5499,
				"createTime": null,
				"tmId": null,
				"tmName": null,
				"category1Id": null,
				"category1Name": null,
				"category2Id": null,
				"category2Name": null,
				"category3Id": null,
				"category3Name": null,
				"hotScore": 0,
				"attrs": null
			}, {
				"id": 5,
				"defaultImg": "./images/mobile03.jpg",
				"title": "Apple iPhone 11 (A2223)",
				"price": 5499,
				"createTime": null,
				"tmId": null,
				"tmName": null,
				"category1Id": null,
				"category1Name": null,
				"category2Id": null,
				"category2Name": null,
				"category3Id": null,
				"category3Name": null,
				"hotScore": 0,
				"attrs": null
			}, {
				"id": 6,
				"defaultImg": "./images/mobile03.jpg",
				"title": "Apple iPhone 11 (A2223)",
				"price": 5499,
				"createTime": null,
				"tmId": null,
				"tmName": null,
				"category1Id": null,
				"category1Name": null,
				"category2Id": null,
				"category2Name": null,
				"category3Id": null,
				"category3Name": null,
				"hotScore": 0,
				"attrs": null
			}, {
				"id": 7,
				"defaultImg": "./images/mobile03.jpg",
				"title": "Apple iPhone 11 (A2223)",
				"price": 5499,
				"createTime": null,
				"tmId": null,
				"tmName": null,
				"category1Id": null,
				"category1Name": null,
				"category2Id": null,
				"category2Name": null,
				"category3Id": null,
				"category3Name": null,
				"hotScore": 0,
				"attrs": null
			}, {
				"id": 8,
				"defaultImg": "./images/mobile03.jpg",
				"title": "Apple iPhone 11 (A2223)",
				"price": 5499,
				"createTime": null,
				"tmId": null,
				"tmName": null,
				"category1Id": null,
				"category1Name": null,
				"category2Id": null,
				"category2Name": null,
				"category3Id": null,
				"category3Name": null,
				"hotScore": 0,
				"attrs": null
			}],
			"pageinfo": {
				"total": 1,
				"pageSize": 8,
				"pagenow": 1,
				"continues": 5,
			}
		},

		meta: {
			msg: '登录成功',
			status: 200
		}
	})
})
app.get('/getdetailinfo/:id', (req, res) => {
	res.send({
		data: {
			"valuesSkuJson": "{\"3|5|7\":6,\"3|4|7\":2,\"2|4|7\":3,\"1|5|7\":5,\"1|4|7\":1,\"2|5|7\":4}",
			"price": 5499,
			"categoryView": {
				"id": 61,
				"category1Id": 2,
				"category1Name": "手机",
				"category2Id": 13,
				"category2Name": "手机通讯",
				"category3Id": 61,
				"category3Name": "手机"
			},
			"spuSaleAttrList": [{
					"id": 1,
					"spuId": 1,
					"baseSaleAttrId": 1,
					"saleAttrName": "选择颜色",
					"spuSaleAttrValueList": [{
						"id": 1,
						"spuId": 1,
						"baseSaleAttrId": 1,
						"saleAttrValueName": "玫瑰金",
						"saleAttrName": "选择颜色",
						"isChecked": "1"
					}, {
						"id": 2,
						"spuId": 21,
						"baseSaleAttrId": 22,
						"saleAttrValueName": "白色",
						"saleAttrName": "选择颜色",
						"isChecked": "0"
					}, {
						"id": 3,
						"spuId": 31,
						"baseSaleAttrId": 32,
						"saleAttrValueName": "黑色",
						"saleAttrName": "选择颜色",
						"isChecked": "0"
					}]
				},
				{
					"id": 2,
					"spuId": 1,
					"baseSaleAttrId": 2,
					"saleAttrName": "选择版本",
					"spuSaleAttrValueList": [{
						"id": 4,
						"spuId": 1,
						"baseSaleAttrId": 2,
						"saleAttrValueName": "16GB",
						"saleAttrName": "选择版本",
						"isChecked": "1"
					}, {
						"id": 5,
						"spuId": 11,
						"baseSaleAttrId": 12,
						"saleAttrValueName": "32GB",
						"saleAttrName": "选择版本",
						"isChecked": "0"
					}, {
						"id": 6,
						"spuId": 21,
						"baseSaleAttrId": 22,
						"saleAttrValueName": "64GB",
						"saleAttrName": "选择版本",
						"isChecked": "0"
					}]
				},
				{
					"id": 3,
					"spuId": 1,
					"baseSaleAttrId": 3,
					"saleAttrName": "选择套装",
					"spuSaleAttrValueList": [{
						"id": 7,
						"spuId": 1,
						"baseSaleAttrId": 3,
						"saleAttrValueName": " 官方标配",
						"saleAttrName": "选择套装",
						"isChecked": "1"
					}]
				}
			],
			"skuInfo": {
				"id": 2,
				"spuId": 1,
				"price": 5499,
				"skuName": "Apple iPhone 11 (A2223) 64GB 红色 移动联通电信双卡双待",
				"skuDesc": "主体\n入网型号\nA2223\n品牌\nApple\n产品名称\niPhone 11\n上市年份\n2019年\n上市月份\n9月\n基本信息\n机身颜色\n红色\n机身长度（mm）\n150.9\n机身重量（g）\n194\n机身材质工艺\n以官网信息为准\n机身宽度（mm）\n75.7\n机身材质分类\n玻璃后盖\n机身厚度（mm）\n8.3\n运营商标志或内容\n无",
				"weight": "0.47",
				"tmId": 1,
				"category3Id": 61,
				"skuDefaultImg": [{
					"imgurl": "./img/s1.00e7489c.png"
				}, {
					"imgurl": "./img/s1.00e7489c.png"
				}, {
					"imgurl": "./img/s1.00e7489c.png"
				}],
				"isSale": 1,
				"skuImageList": [{
					"id": 6,
					"skuId": 2,
					"imgName": "./img/s1.00e7489c.png",
					"imgUrl": "http://192.168.200.128:8080/group1/M00/00/00/wKjIgF42RLOAd5YSAANTQTjaVjQ819.jpg",
					"spuImgId": 2,
					"isDefault": "0"
				}, {
					"id": 6,
					"skuId": 2,
					"imgName": "./img/s2.49618bd1.png",
					"imgUrl": "http://192.168.200.128:8080/group1/M00/00/00/wKjIgF42RLOAd5YSAANTQTjaVjQ819.jpg",
					"spuImgId": 2,
					"isDefault": "0"
				}, {
					"id": 6,
					"skuId": 2,
					"imgName": "./img/s3.2cdd4ee2.png",
					"imgUrl": "http://192.168.200.128:8080/group1/M00/00/00/wKjIgF42RLOAd5YSAANTQTjaVjQ819.jpg",
					"spuImgId": 2,
					"isDefault": "0"
				}],
				"skuAttrValueList": [{
					"id": 6,
					"attrId": 1,
					"valueId": 6,
					"skuId": 2
				}, ],
				"skuSaleAttrValueList": null
			}
		},

		meta: {
			msg: '登录成功',
			status: 200
		}
	})
})
app.post('/shopcar/:id/:num', (req, res) => {
	res.send({
		data: null,
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.get('/carlist', (req, res) => {
	res.send({
		data: [{
				"id": 61,
				"userId": "2",
				"skuId": 4,
				"cartPrice": 5999,
				"skuNum": 4,
				"imgUrl": "./img/s1.00e7489c.png",
				"skuName": "Apple iPhone 11 (A2223) ",
				"isChecked": 1,
				"skuPrice": 5999
			},
			{
				"id": 62,
				"userId": "2",
				"skuId": 2,
				"cartPrice": 5499,
				"skuNum": 1,
				"imgUrl": "./img/s1.00e7489c.png",
				"skuName": "Apple iPhone 11 (A2223) 64GB 红色",
				"isChecked": 0,
				"skuPrice": 5499
			}
		],

		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.delete('/deletecar/:id', (req, res) => {
	res.send({
		data: null,
		meta: {
			msg: '删除成功',
			status: 200
		}
	})
})
app.get('/checkCart/:id/:ischecked', (req, res) => {
	res.send({
		data: null,
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.get('/sendCode/:phone', (req, res) => {
	res.send({
		data: 123456,
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.post('/register', (req, res) => {
	res.send({
		data: null,
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.post('/login', (req, res) => {
	res.send({
		data: {
			token: "90aa16f24d04c7d882051412f9ec45b"
		},
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.get('/getUserInfo', (req, res) => {
	res.send({
		data: {
			nickName: "Administrator",
			name: "Admin",
			password: 123456
		},
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.get('/logout', (req, res) => {
	res.send({
		data: null,
		meta: {
			msg: '退出成功',
			status: 200
		}
	})
})
app.get('/useradress', (req, res) => {
	res.send({
		data: {
			list: [{
				id: 1,
				name: '张三',
				adress1: '北京市昌平区宏福科技园综合楼',
				phone: '13590909098',
				isdefault: 1
			}, {
				id: 2,
				name: '李四',
				adress1: '北京市昌平区宏福科技园综合楼',
				phone: '323226246',
				isdefault: 0
			}]
		},
		meta: {
			msg: '退出成功',
			status: 200
		}
	})
})
app.get('/trade', (req, res) => {
	res.send({
		data: {
			"totalAmount": 23996,
			"userAddressList": [{
				"id": 2,
				"userAddress": "北京市昌平区2",
				"userId": 2,
				"consignee": "admin",
				"phoneNum": "15011111111",
				"isDefault": "1"
			}],
			"tradeNo": "1b23c1efc8144bfc83e51807f4e71d3a",
			"totalNum": 1,
			"totalprice": 5999,
			"detailArrayList": [{
				"id": 1,
				"orderId": null,
				"skuId": 4,
				"skuName": "Apple iPhone 11 移动联通电信4G手机 双卡双待",
				"imgUrl": "./img/s1.00e7489c.png",
				"orderPrice": 5999,
				"skuNum": 4,
				"hasStock": null
			}]
		},
		meta: {
			msg: '退出成功',
			status: 200
		}
	})
})
app.post('/submittrade/:tradeNo', (req, res) => {
	res.send({
		data: 71,
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.get('/payment/:id', (req, res) => {
	res.send({
		data: {
			"codeUrl": "weixin://wxpay/bizpayurl?pr=P0aPBJK",
			"orderId": 71,
			"totalFee": 23996,
			"resultCode": "SUCCESS"
		},
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.get('/queryPayStatus/:id', (req, res) => {
	res.send({
		data: null,
		"message": "支付中",
		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.get('/order/:page/:limit', (req, res) => {
	res.send({
		"data": {
			"records": [{
				"id": 70,
				"consignee": "admin",
				"consigneeTel": "15011111111",
				"totalAmount": 29495,
				"orderStatus": "UNPAID",
				"userId": 2,
				"paymentWay": "ONLINE",
				"deliveryAddress": "北京市昌平区2",
				"orderComment": "",
				"outTradeNo": "ATGUIGU1584247289311481",
				"tradeBody": "Apple iPhone 11 (A2223) 128GB手机 双卡双待 A",
				"createTime": "2020-03-15 12:41:29",
				"expireTime": "2020-03-16 12:41:29",
				"processStatus": "UNPAID",
				"trackingNo": null,
				"parentOrderId": null,
				"imgUrl": null,
				"orderDetailList": [{
					"id": 81,
					"orderId": 70,
					"skuId": 2,
					"skuName": "Apple iPhone 11 (A2223) 64GB 红色",
					"imgUrl": "./img/s1.00e7489c.png",
					"orderPrice": 5499,
					"skuNum": 1,
					"hasStock": null
				}, ],
				"orderStatusName": "未支付",
				"wareId": null
			}, ],
			"pageinfo":{
				"total": 41,
				"pageSize": 2,
				"pagenow": 1,
				"continues": 5
			}
		},

		meta: {
			msg: '添加成功',
			status: 200
		}
	})
})
app.listen(3000)
console.log('服务器启动成功');
