// 引入类库相关
const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const nunjucks = require('nunjucks');

// 引入session相关
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);

const database = require('./config/config').database;
const sessionStore = new MySQLStore(database);

// 引入全局控制中间件
const authControl = require('./middleWare/authControl');

// 引入路由相关
const adminRouter = require('./routes/admin');
const liveRouter = require('./routes/live');
const activitiesRouter = require('./routes/activities');
const lifejobRouter = require('./routes/lifejob.js');
const resourceRouter = require('./routes/resource.js');
const homeRouter = require('./routes/home.js');
const managerRouter = require('./routes/manager.js');
const app = express();

// view engine setup 配置模板引擎
app.set('views', path.join(__dirname, 'views'));
nunjucks.configure('views', {
	autoescape: true,
	express: app,
	noCache: true,
});

// 使用session
app.use(session({
	key: 'itLike',
	secret: 'itLike',
	resave: false,
	saveUninitialized: true,
	cookie: {maxAge: 24 * 3600 * 1000},
	rolling: true,
	store: sessionStore,
}))
// 使用各种默认集成的中间件
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
	extended: false
}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public/manager')));
// 配置静态资源文件夹
app.use(express.static(path.join(__dirname, 'public')));
// 使用权限控制中间件
app.use(authControl);
// 使用路由中间件
app.use('/', managerRouter);
app.use('/api/auth/admin', adminRouter);
app.use('/api/auth/live', liveRouter);
app.use('/api/auth/activities', activitiesRouter);
app.use('/api/auth/lifejob', lifejobRouter);
app.use('/api/auth/resource', resourceRouter);
app.use('/api/auth/home', homeRouter);

// catch 404 and forward to error handler 页面404处理中间件
app.use(function(req, res, next) {
	next(createError(404));
});

// error handler 全局错误处理中间件
app.use(function(err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};
	// render the error page
	res.status(err.status || 500);
	res.render('error');
});

module.exports = app;
