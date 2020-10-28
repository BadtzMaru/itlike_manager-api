const express = require('express');
const router = express.Router();
const {
	lifejob_img_up
} = require('../controller/managerApi/uploadFile.js');
const Query = require('../config/dbHelper');
// 上传直播封面图和焦点图
router.post('/upload_lifejob', lifejob_img_up.single('lifejob_img'), (req, res, next) => {
	res.json({
		status: 1,
		msg: '封面上传成功',
		data: {
			name: '/uploads/images/lifejob/' + req.file.filename
		},
	});
});
// 获取所属家园
router.get('/job_family', (req, res, next) => {
	const sql = `SELECT * FROM t_job_family`;
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
// 获取学前所属分类
router.get('/job_pre', (req, res, next) => {
	const sql = `SELECT * FROM t_job_pre`;
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

// 添加职场人生
router.post('/add', (req, res, next) => {
	const {
		token,
		job_name,
		job_img,
		job_author,
		job_time,
		job_content,
		job_pre_edu_id,
		job_family_edu_id,
		is_focus,
		focus_img,
	} = req.body;
	if (req.session.token !== token) {
		res.json({
			status: 0,
			msg: '非法token'
		});
	} else {
		const sql = `INSERT INTO t_job VALUES (?,?,?,?,?,?,?,?,?,?,?,?)`;
		const values = [
			null,
			job_name,
			job_img,
			job_author,
			job_time,
			0,
			job_content,
			job_pre_edu_id,
			job_family_edu_id,
			is_focus,
			focus_img,
			0,
		];
		Query(sql, values).then(result => {
			res.json({
				status: result.code,
				msg: '添加职场人生成功',
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
// 获取列表
router.get('/list', (req, res, next) => {
	// 1. 获取页码和页数
	let pageNum = req.query.page_num || 1;
	let pageSize = req.query.page_size || 4;
	const sql1 = `SELECT COUNT(*) as job_count FROM t_job`;
	const sql2 = `SELECT * FROM t_job ORDER BY id DESC LIMIT ${(pageNum - 1) * pageSize},${pageSize}`;
	Query(sql1).then(result1 => {
		Query(sql2).then(result => {
			res.json({
				status: result.code,
				msg: '获取职场人生列表成功',
				data: {
					job_count: result1.data[0].job_count,
					job_list: result.data,
				},
			});
		}).catch(error => {
			res.json({
				status: error.code,
				msg: '获取职场人生列表失败',
				data: error.data,
			});
		});
	});
});
// 设置是否首页轮播图
router.get('/set_focus_job', (req, res, next) => {
	const id = req.query.id;
	const is_focus = Number(req.query.is_focus) || 0;
	const sql = `UPDATE t_job SET is_focus=? WHERE id=?`;
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
// 删除一个活动
router.get('/delete_job', (req, res, next) => {
	const id = req.query.id;
	const sql = `DELETE FROM t_job WHERE id=?`;
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
// 修改一条活动
router.post('/edit', (req, res, next) => {
	const {
		token,
		id,
		job_name,
		job_img,
		job_author,
		job_time,
		job_content,
		job_pre_edu_id,
		job_family_edu_id,
		is_focus,
		focus_img,
	} = req.body;
	if (req.session.token !== token) {
		res.json({
			status: 0,
			msg: '非法token',
		});
	} else {
		const sql =
			`UPDATE t_job SET job_name=?,job_img=?,job_author=?,job_time=?,job_content=?,job_pre_edu_id=?,job_family_edu_id=?,is_focus=?,focus_img=? WHERE id=?`;
		const values = [
			job_name,
			job_img,
			job_author,
			job_time,
			job_content,
			job_pre_edu_id,
			job_family_edu_id,
			is_focus,
			focus_img,
			id,
		];
		Query(sql, values).then(result => {
			res.json({
				status: result.code,
				msg: '修改成功',
				data: {},
			});
		}).catch(error => {
			res.json({
				status: error.code,
				msg: '修改失败',
				data: error.data,
			});
		});
	}
});

module.exports = router;
