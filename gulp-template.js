'use strict';

var gulp = require('gulp'),
    sass =  require('gulp-sass'),
    browserSync = require('browser-sync'),
    del = require('del'),
    imagemin = require('gulp-imagemin'),
    uglify = require('gulp-uglify'),
    usemin = require('gulp-usemin'),
    rev = require('gulp-rev'),
    cleanCss = require('gulp-clean-css'),
    flatmap = require('gulp-flatmap'),
    htmlmin = require('gulp-htmlmin');

gulp.task('sass', function () {
    return gulp.src('./css.*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./css'));
});

//watch for changes in scss and convert to css
gulp.task('sass:watch', function() {
    gulp.watch('./css/*.scss', ['sass']);
});

//browserSync
gulp.task('browser-sync', function () {
   var files = [
      './*.html',
      './css/*.css',
      './img/*.{png,jpg,gif}',
      './js/*.js'
   ];

    browserSync.init(files, {
        server: {
            baseDir: "./"
        }
    });
});

//default task
//for version 4 \/
//gulp.task('default', gulp.series('browser-sync', 'sass:watch'));
gulp.task('default', ['browser-sync'], function() {
    gulp.start('sass:watch');
});

//delete dist folder before rebuilding
gulp.task('clean', function () {
    return del(['dist']);
});

//minify files for dist folder
gulp.task('imagemin', function() {
    return gulp.src('img/*.{png,jpg,gif}')
    .pipe(imagemin({ optimizationLevel: 3, progressive: true, interlaced: true }))
    .pipe(gulp.dest('dist/img'))
});

//build dist folder
gulp.task('usemin', function() {
    return gulp.src('./*.html')
    .pipe(flatmap(function(stream, file){
        return stream
        .pipe(usemin({
            css: [ rev() ],
            html: [ function() { return htmlmin({ collapseWhitespace: true })} ],
            js: [ uglify(), rev() ],
            inlinejs: [ uglify() ],
            inlinecss: [ cleanCss(), 'concat' ]
        }))
    }))
    .pipe(gulp.dest('dist/'));
});

gulp.task('build',['clean'], function() {
    gulp.start('imagemin','usemin');
});
