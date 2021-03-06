'use strict';

const path = require('path');
const gulp = require('gulp');
const jshint = require('gulp-jshint');
const superagent = require('superagent');
const fs = require('fs-extra');
const glob = require('glob');

// Got problems? Try logging 'em
// const logging = require('plylog');
// logging.setVerbose();

const project = require('./gulp/project.js');
const ensureLazyFragments = require('./gulp/ensure-lazy-fragments.js');

const root = path.resolve(process.cwd(), 'images');
const optimizedImagesRoot = path.resolve(process.cwd(), 'images-optimized');
const imageOptions = {
  logos: '250,scale-down',
};

// Optimize images with ImageOptim
// Run with `yarn run build optimize-images`
gulp.task('optimize-images', () =>
  glob('images/**/*.{jpg,png,svg}', (err, files) => {
    for (const file of files) {
      const relativeFile = file.substring(file.indexOf('/') + 1);
      fs.ensureDirSync(path.resolve(optimizedImagesRoot, path.dirname(relativeFile)));
      if (path.extname(file) === '.svg') {
        fs.copySync(file, path.resolve(optimizedImagesRoot, relativeFile));
      } else {
        const imageCategory = path.relative(root, file).split('/')[0];
        const options = imageOptions[imageCategory] || 'full';
        superagent.post(`https://im2.io/nddfzrzzpk/${options}`)
        .attach('file', file)
        .end((err, res) =>  {
          console.log(`Finished optimizing ${file}`);
          fs.writeFileSync(path.resolve(optimizedImagesRoot, relativeFile), res.body);
        });
      }
    }
  })
);

gulp.task('ensure-images-optimized', () =>
  new Promise((resolve, reject) => {
    if (!fs.existsSync(optimizedImagesRoot)) {
      reject('`images-optimized` does not exist. Make sure to run `yarn run build optimize-images`');
    } else {
      resolve();
    }
  })
);

gulp.task('ensure-lazy-fragments', ensureLazyFragments);

function linter() {
  return gulp.src('src/**/*.html')
      .pipe(jshint.extract()) // Extract JS from .html files
      .pipe(jshint())
      .pipe(jshint.reporter('jshint-stylish'));
}

// Clean the build directory, split all source and dependency files into streams
// and process them, and output the complete project
gulp.task('default', gulp.series([
  linter,
  project
]));
