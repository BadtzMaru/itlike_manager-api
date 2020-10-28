const express = require('express');
const router = express.Router();
const {
	live_img_up
} = require('../controller/managerApi/uploadFile.js');
const Query = require('../config/dbHelper');
// 上传直播封面图和焦点图
router.post('/upload_live', live_img_up.single('live_img'), (req, res, next) => {
	res.json({
		status: 1,
		msg: '封面上传成功',
		data: {
			name: '/uploads/images/live/' + req.file.filename
		},
	});
});
// 获取园区主题
router.get('/live_theme', (req, res, next) => {
	const sql = `SELECT * FROM t_live_theme`;
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
// 获取适用人群
router.get('/live_person', (req, res, next) => {
	const sql = `SELECT * FROM t_live_person`;
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
// 添加直播课程
router.post('/add', (req, res, next) => {
	const {
		token,
		live_title,
		live_author,
		live_img,
		live_begin_time,
		live_end_time,
		live_price,
		live_person_id,
		live_theme_id,
		is_focus,
		focus_img,
		live_url
	} = req.body;
	if (req.session.token !== token) {
		res.json({
			status: 0,
			msg: '非法token'
		});
	} else {
		const sql = `INSERT INTO t_live VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)`;
		const values = [
			null, live_title, live_img, live_begin_time, live_end_time, live_author, live_url, live_price, live_person_id,
			live_theme_id, is_focus, focus_img, 0
		];
		Query(sql, values).then(result => {
			res.json({
				status: result.code,
				msg: '新增直播课成功',
				data: {},
			});
		}).catch(error => {
			res.json({
				status: error.code,
				data: error.data,
			});
		});
	}
});
// 获取直播列表
router.get('/list', (req, res, next) => {
	// 1. 获取页码和页数
	let pageNum = req.query.page_num || 1;
	let pageSize = req.query.page_size || 4;
	const sql1 = `SELECT COUNT(*) as live_count FROM t_live`;
	const sql2 =
		`SELECT t_live.*,t_live_person.live_person_name,t_live_theme.live_theme_title FROM t_live LEFT JOIN t_live_person ON t_live.live_person_id=t_live_person.id LEFT JOIN t_live_theme ON t_live.live_theme_id=t_live_theme.id  ORDER BY id DESC LIMIT ${(pageNum - 1) * pageSize},${pageSize}`;
	Query(sql1).then(result1 => {
		Query(sql2).then(result => {
			res.json({
				status: result.code,
				msg: '查询直播列表成功',
				data: {
					live_count: result1.data[0].live_count,
					list: result.data,
				},
			});
		}).catch(error => {
			res.json({
				status: error.code,
				msg: '查询直播列表失败',
				data: error.data,
			});
		});
	});
});
// 设置是否首页轮播图
router.get('/set_focus_live', (req, res, next) => {
	const id = req.query.id;
	const is_focus = Number(req.query.is_focus) || 0;
	const sql = `UPDATE t_live SET is_focus=? WHERE id=?`;
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
// 删除直播
router.get('/delete_live', (req, res, next) => {
	const id = req.query.id;
	const sql = `DELETE FROM t_live WHERE id=?`;
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
// 修改一条直播课程
router.post('/edit', (req, res, next) => {
	const {
		token,
		id,
		live_title,
		live_author,
		live_img,
		live_begin_time,
		live_end_time,
		live_price,
		live_person_id,
		live_theme_id,
		is_focus,
		focus_img,
		live_url
	} = req.body;
	if (req.session.token !== token) {
		res.json({
			status: 0,
			msg: '非法token',
		});
	} else {
		const sql =
			`UPDATE t_live SET live_title=?,live_img=?,live_begin_time=?,live_end_time=?,live_author=?,live_url=?,live_price=?,live_person_id=?,live_theme_id=?,is_focus=?,focus_img=? WHERE id=?`;
		const values = [live_title, live_img, live_begin_time, live_end_time, live_author, live_url, live_price,
			live_person_id, live_theme_id, is_focus, focus_img, id
		];
		Query(sql, values).then(result => {
			res.json({
				status: result.code,
				msg: '修改直播课程成功',
				data: {},
			});
		}).catch(error => {
			res.json({
				status: error.code,
				msg: '修改直播课程失败',
				data: error.data,
			});
		});
	}
});


module.exports = router;
