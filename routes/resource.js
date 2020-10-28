const express = require('express');
const router = express.Router();
const {
	resource_file_up,
	resource_img_up,
} = require('../controller/managerApi/uploadFile.js');
const Query = require('../config/dbHelper');
// 多文件上传
router.post('/upload_many_file', resource_file_up.array('resource_file', 10), (req, res, next) => {
	res.json({
		status: 1,
		data: {
			url: `uploads/resource/${req.files[0].filename}`,
			name: `${req.files[0].originalname}`,
			uid: req.files[0].filename,
		},
	});
});
// 上传直播封面图和焦点图
router.post('/upload_resource', resource_img_up.single('resource_upload_img'), (req, res, next) => {
	res.json({
		status: 1,
		msg: '上传成功',
		data: {
			name: '/uploads/images/resource/' + req.file.filename
		},
	});
});
// 获取所属分类
router.get('/r_category', (req, res, next) => {
	const sql = `SELECT * FROM t_resource_category`;
	Query(sql).then(result => {
		res.json({
			status: result.code,
			data: result.data,
		});
	}).catch(error => {
		res.json({
			status: error.code,
			data: error.data,
		});
	});
});
// 获取所属班级
router.get('/r_classes', (req, res, next) => {
	const sql = `SELECT * FROM t_resource_classes`;
	Query(sql).then(result => {
		res.json({
			status: result.code,
			data: result.data,
		});
	}).catch(error => {
		res.json({
			status: error.code,
			data: error.data,
		});
	});
});
// 获取所属分类
router.get('/r_category', (req, res, next) => {
	const sql = `SELECT * FROM t_resource_category`;
	Query(sql).then(result => {
		res.json({
			status: result.code,
			data: result.data,
		});
	}).catch(error => {
		res.json({
			status: error.code,
			data: error.data,
		});
	});
});
// 获取所属区域
router.get('/r_area', (req, res, next) => {
	const sql = `SELECT * FROM t_resource_area`;
	Query(sql).then(result => {
		res.json({
			status: result.code,
			data: result.data,
		});
	}).catch(error => {
		res.json({
			status: error.code,
			data: error.data,
		});
	});
});
// 获取所属格式
router.get('/r_format', (req, res, next) => {
	const sql = `SELECT * FROM t_resource_format`;
	Query(sql).then(result => {
		res.json({
			status: result.code,
			data: result.data,
		});
	}).catch(error => {
		res.json({
			status: error.code,
			data: error.data,
		});
	});
});
// 获取所属素材
router.get('/r_mate', (req, res, next) => {
	const sql = `SELECT * FROM t_resource_mate`;
	Query(sql).then(result => {
		res.json({
			status: result.code,
			data: result.data,
		});
	}).catch(error => {
		res.json({
			status: error.code,
			data: error.data,
		});
	});
});
// 添加资源
router.post('/add', (req, res, next) => {
	const {
		token,
		resource_name,
		resource_author,
		resource_publish_time,
		resource_content,
		resource_category_id,
		resource_classes_id,
		resource_area_id,
		resource_mate_id,
		resource_format_id,
		resource_img,
		resource_price,
		is_focus,
		focus_img,
	} = req.body;
	if (req.session.token !== token) {
		res.json({
			status: 0,
			msg: '非法token',
		});
	} else {
		if (resource_content) {
			let fileArr = [];
			let fileTag = new Date().getTime();
			resource_content.forEach((n, i) => {
				let _arr = [null];
				for (let m in n) {
					_arr.push(n[m]);
				}
				_arr.push(fileTag);
				fileArr.push(_arr);
			});
			// 执行插入操作
			let sql1 = `INSERT INTO t_resource_file(id,url,name,uid,tag) VALUES ?`;
			Query(sql1, [fileArr]).then(result => {
				let sql2 = `INSERT INTO t_resource VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
				const values = [
					null,
					resource_name,
					resource_author,
					0, // resource_views,
					resource_publish_time,
					fileTag, //resource_content,
					resource_category_id,
					resource_classes_id,
					resource_area_id,
					resource_mate_id,
					resource_format_id,
					resource_img,
					resource_price,
					is_focus,
					focus_img,
					0,
				];
				Query(sql2, values).then(result => {
					res.json({
						status: result.code,
						msg: '添加资源成功',
						data: {},
					});
				}).catch(error => {
					console.log(error);
					res.json({
						status: error.code,
						data: error.data,
					});
				});
			}).catch(error => {
				console.log(error);
				res.json({
					status: error.code,
					data: error.data,
				});
			});
		}
	}
});
// 获取列表
router.get('/list', (req, res, next) => {
	// 1. 获取页码和页数
	let pageNum = req.query.page_num || 1;
	let pageSize = req.query.page_size || 4;
	const sql1 = `SELECT COUNT(*) as resource_count FROM t_resource`;
	const sql2 =
		`SELECT t_resource.*,t_resource_category.category_name FROM t_resource LEFT JOIN t_resource_category ON t_resource.resource_category_id=t_resource_category.id ORDER BY t_resource.id DESC LIMIT ${(pageNum - 1) * pageSize},${pageSize}`;
	Query(sql1).then(result1 => {
		Query(sql2).then(result => {
			res.json({
				status: result.code,
				msg: '获取列表成功',
				data: {
					resource_count: result1.data[0].resource_count,
					resource_list: result.data,
				},
			});
		}).catch(error => {
			res.json({
				status: error.code,
				msg: '获取列表失败',
				data: error.data,
			});
		});
	});
});
// 设置是否首页轮播图
router.get('/set_focus_resource', (req, res, next) => {
	const id = req.query.id;
	const is_focus = Number(req.query.is_focus) || 0;
	const sql = `UPDATE t_resource SET is_focus=? WHERE id=?`;
	const values = [is_focus, id];
	Query(sql, values).then(result => {
		res.json({
			status: result.code,
			msg: '更新成功',
			data: {},
		});
	}).catch(error => {
		res.json({
			status: error.code,
			msg: '更新失败',
			data: error.data,
		});
	})
});
// 删除资源
router.get('/delete_resource', (req, res, next) => {
	const id = req.query.id;
	const sql = `DELETE FROM t_resource WHERE id=?`;
	Query(sql, [id]).then(result => {
		res.json({
			status: result.code,
			msg: '删除成功',
			data: {},
		});
	}).catch(error => {
		res.json({
			status: error.code,
			msg: '删除失败',
			data: error.data,
		});
	})
});
// 获取上传文件列表
router.get('/file_list', (req, res, next) => {
	let tag = req.query.tag;
	let sql = `SELECT url,name,uid FROM t_resource_file WHERE tag=?`;
	Query(sql, [tag]).then(result => {
		res.json({
			status: result.code,
			msg: '获取文件列表成',
			data: result.data,
		});
	}).catch(error => {
		res.json({
			status: error.code,
			msg: '查询文件列表失败',
			data: error.data,
		});
	})
});
// 修改一条资源
router.post('/edit', (req, res, next) => {
	let {
		token,
		id,
		tag,
		resource_name,
		resource_author,
		resource_publish_time,
		resource_content,
		resource_category_id,
		resource_classes_id,
		resource_area_id,
		resource_mate_id,
		resource_format_id,
		resource_img,
		resource_price,
		is_focus,
		focus_img,
	} = req.body;
	if (req.session.token !== token) {
		res.json({
			status: 0,
			msg: '非法token',
		});
	} else {
		// 先删除后添加
		let sql0 = `DELETE FROM t_resource_file WHERE tag=?`;
		Query(sql0, [tag]).then(result => {
			// 删除成功,添加资源
			if (resource_content) {
				let fileArr = [];
				resource_content.forEach((n, i) => {
					let _arr = [null];
					for (let m in n) {
						_arr.push(n[m]);
					}
					_arr.push(tag);
					fileArr.push(_arr);
				});
				// 执行插入操作
				let sql1 = `INSERT INTO t_resource_file(id,url,name,uid,tag) VALUES ?`;
				Query(sql1, [fileArr]).then(result => {
					let sql2 =
						`UPDATE t_resource SET resource_name=?,resource_author=?,resource_publish_time=?,resource_category_id=?,resource_classes_id=?,resource_area_id=?,resource_mate_id=?,resource_format_id=?,resource_img=?,resource_price=?,is_focus=?,focus_img=? WHERE id=?`;
					const values = [
						resource_name,
						resource_author,
						resource_publish_time,
						resource_category_id,
						resource_classes_id,
						resource_area_id,
						resource_mate_id,
						resource_format_id,
						resource_img,
						resource_price,
						is_focus,
						focus_img,
						id,
					];
					Query(sql2, values).then(result => {
						res.json({
							status: result.code,
							msg: '修改资源成功',
							data: {},
						});
					}).catch(error => {
						console.log(error);
						res.json({
							status: error.code,
							data: error.data,
						});
					});
				}).catch(error => {
					console.log(error);
					res.json({
						status: error.code,
						data: error.data,
					});
				});
			} else {
				res.json({
					status: 0,
					msg: '上传的资源不能为空',
				});
			}
		}).catch(error => {
			// 删除失败
			res.json({
				status: error.code,
				msg: 'SQL语句出现问题',
				data: {},
			});
		});

	}
});
module.exports = router;
