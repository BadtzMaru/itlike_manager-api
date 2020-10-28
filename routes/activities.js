const express = require('express');
const router = express.Router();
const {activities_img_up} = require('../controller/managerApi/uploadFile.js');
const Query = require('../config/dbHelper');
// 上传直播封面图和焦点图
router.post('/upload_activities', activities_img_up.single('activities_img'), (req, res, next) => {
    res.json({
        status: 1,
        msg: '封面上传成功',
        data: {name: '/uploads/images/activities/' + req.file.filename},
    });
});
// 获取活动地点
router.get('/activities_address', (req, res, next) => {
    const sql = `SELECT * FROM t_activities_address`;
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
// 获取招生对象
router.get('/activities_object', (req, res, next) => {
    const sql = `SELECT * FROM t_activities_object`;
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
// 获取营期
router.get('/activities_bus', (req, res, next) => {
    const sql = `SELECT * FROM t_activities_bus`;
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
// 添加活动
router.post('/add', (req, res, next) => {
    const {token, activities_name, activities_time, activities_img, activities_price, activities_tag, activities_count, activities_address_id, activities_object_id, activities_bus_day_id, activities_intro, activities_trip, activities_day, activities_notice, is_focus, focus_img} = req.body;
    if (req.session.token !== token) {
        res.json({
            status: 0,
            msg: '非法token'
        });
    } else {
        const sql = `INSERT INTO t_activities VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
        const values = [null, activities_name, activities_time, activities_img, activities_price, activities_tag, activities_count, activities_address_id, activities_object_id, activities_bus_day_id, activities_intro, activities_trip, activities_day, activities_notice, is_focus, focus_img,0];
        Query(sql, values).then(result => {
            res.json({
                status: result.code,
                msg: '添加活动成功',
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
    const sql1 = `SELECT COUNT(*) as activities_count FROM t_activities`;
    const sql2 = `SELECT * FROM t_activities ORDER BY id DESC LIMIT ${(pageNum - 1) * pageSize},${pageSize}`;
    Query(sql1).then(result1 => {
        Query(sql2).then(result => {
            res.json({
                status: result.code,
                msg: '获取活动列表成功',
                data: {
                    activities_count: result1.data[0].activities_count,
                    activities_list: result.data,
                },
            });
        }).catch(error => {
            res.json({
                status: error.code,
                msg: '获取活动列表失败',
                data: error.data,
            });
        });
    });
});
// 设置是否首页轮播图
router.get('/set_focus_activities', (req, res, next) => {
    const id = req.query.id;
    const is_focus = Number(req.query.is_focus) || 0;
    const sql = `UPDATE t_activities SET is_focus=? WHERE id=?`;
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
router.get('/delete_activities', (req, res, next) => {
    const id = req.query.id;
    const sql = `DELETE FROM t_activities WHERE id=?`;
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
    const {token, id, activities_name, activities_time, activities_img, activities_price, activities_tag, activities_count, activities_address_id, activities_object_id, activities_bus_day_id, activities_intro, activities_trip, activities_day, activities_notice, is_focus, focus_img} = req.body;
    if (req.session.token !== token) {
        res.json({
            status: 0,
            msg: '非法token',
        });
    } else {
        const sql = `UPDATE t_activities SET activities_name=?,activities_time=?,activities_img=?,activities_price=?,activities_tag=?,activities_count=?,activities_address_id=?,activities_object_id=?,activities_bus_day_id=?,activities_intro=?,activities_trip=?,activities_day=?,activities_notice=?,is_focus=?,focus_img=? WHERE id=?`;
        const values = [activities_name, activities_time, activities_img, activities_price, activities_tag, activities_count, activities_address_id, activities_object_id, activities_bus_day_id, activities_intro, activities_trip, activities_day, activities_notice, is_focus, focus_img, id];
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
