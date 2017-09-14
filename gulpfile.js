var gulp = require('gulp');
var bower = require('gulp-bower');
var runSequence = require('run-sequence');

var jsFilesToCopy = [
    'bower_components/jquery/dist/jquery.min.js',
    'bower_components/jquery.easing/js/jquery.easing.min.js',
    'bower_components/jcarousel/dist/jquery.jcarousel.min.js',
    'bower_components/jquery-vgrid/jquery.vgrid.min.js'
];

gulp.task('default', function() {
    runSequence('bower', 'copy-vendor-js')
});

gulp.task('bower', function() {
    return bower();
});

gulp.task('copy-vendor-js', function () {
    gulp.src(jsFilesToCopy)
        .pipe(gulp.dest('public/wp-content/themes/allihoppa/js'));
});
