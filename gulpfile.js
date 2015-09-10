var gulp = require('gulp');
var gutil = require('gulp-util');
var replace = require('gulp-replace');
var bower = require('bower');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var minifyCss = require('gulp-minify-css');
var rename = require('gulp-rename');
var sh = require('shelljs');
var coffee = require('gulp-coffee');

var paths = {
  sass: ['./scss/*.scss'],
  coffee: ['./coffee/*.coffee']
};

gulp.task('default', ['sass', 'coffee', 'chrome_gcm']);

gulp.task('sass', function(done) {
  gulp.src(paths.sass)
    .pipe(sass({ errLogToConsole: true}))
    .pipe(rename({ extname: '.css' }))
    .pipe(concat('style.css'))
    .pipe(gulp.dest('./www/css'))
    .on('end', done);
});

gulp.task('coffee', function(done) {
  gulp.src(paths.coffee)
  .pipe(coffee({bare: true}).on('error', gutil.log))
  .pipe(concat('application.js'))
  .pipe(replace(/\$GCM_SENDER_ID/, process.env.GCM_SENDER_ID))
  .pipe(gulp.dest('./www/js'))
  .on('end', done);
});

gulp.task('chrome_gcm', function() {
   gulp.src('./chrome_gcm/*')
    .pipe(replace(/\$GCM_SENDER_ID/, process.env.GCM_SENDER_ID))
    .pipe(gulp.dest('./www/chrome_gcm'));
});

gulp.task('watch', function() {
  gulp.watch(paths.sass, ['sass']);
  gulp.watch(paths.coffee, ['coffee']);
});
