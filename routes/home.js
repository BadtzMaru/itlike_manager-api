const express = require('express');
const router = express.Router();
const {
	home_img_up
} = require('../controller/managerApi/uploadFile.js')
const Query = require('../config/dbHelper.js');
const homeController = require('../controller/managerApi/homeController.js');

// 上传直播封面图和焦点图
router.post('/upload_home', home_img_up.single('site_logo'), (req, res, next) => {
	res.json({
		status: 1,
		msg: '图片上传成功',
		data: {
			name: '/uploads/images/home/' + req.file.filename
		},
	});
});

router.get('/source_count', (req, res, next) => homeController.getAllSourceCount(result => res.json(result)));
router.get('/buy_count', (req, res, next) => {
	let sql =
		`
		SELECT t4.resource,t2.job,t1.activities,t3.live FROM (SELECT SUM(t_activities.buy_count) activities FROM t_activities) t1,(SELECT SUM(t_job.buy_count) job FROM t_job) t2,(SELECT SUM(t_live.buy_count) live FROM t_live) t3,(SELECT SUM(t_resource.buy_count) resource FROM t_resource) t4
	`;
	Query(sql).then(result => {
		res.json({
			status: result.code,
			msg: '获取数据成功',
			data: result.data[0],
		});
	}).catch(error => {
		res.json({
			status: result.code,
			msg: '获取数据失败',
			data: {},
		});
	});
});
// 获取网站配置信息
router.get('/info', (req, res, next) => {
	let sql = `SELECT * FROM t_home_message WHERE ID = 1`;
	Query(sql).then(result => {
		res.json({
			status: result.code,
			msg: '获取网站配置信息成功',
			data: result.data[0],
		});
	}).catch(error => {
		res.json({
			status: result.code,
			msg: '获取数据失败',
			data: {},
		});
	});
});
// 修改网站配置信息
router.post('/edit', (req, res, next) => {
	let {
		token,
		site_name,
		site_keyword,
		site_des,
		site_logo,
		site_copy,
		site_bei,
	} = req.body;
	if (req.session.token !== token) {
		res.json({
			status: 0,
			msg: '非法token',
		});
	} else {
		const sql =
			`UPDATE t_home_message SET site_name=?,site_keyword=?,site_des=?,site_logo=?,site_copy=?,site_bei=? WHERE id=1`;
		Query(sql, [
			site_name,
			site_keyword,
			site_des,
			site_logo,
			site_copy,
			site_bei,
		]).then(result => {
			res.json({
				status: 1,
				msg: '修改成功',
			});
		}).catch(error => {
			res.json({
				status: 1,
				msg: '修改失败',
			});
		})
	}

});
module.exports = router;
