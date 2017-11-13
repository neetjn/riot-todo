const path = require('path')
const webpack = require('webpack')

function resolve (dir) {
  return path.join(__dirname, '..', dir)
}

const ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = {
  entry: './src/main.js',
  output: {
    path: resolve('./dist'),
    publicPath: 'dist/',
    filename: 'dist.js',
    libraryTarget: 'umd',
    umdNamedDefine: true
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            babelrc: false,
            presets: ['env'],
            plugins: ['add-module-exports']
          }
        }
      },
      {
        test: /\.tag$/,
        exclude: /node_modules/,
        loader: 'riot-tag-loader',
        query: {
          hot: false
        }
      }
    ]
  },
  plugins: [
    new ExtractTextPlugin('dist.css'),
    new webpack.ProvidePlugin({
      'riot': 'riot'
    })
  ]
}

if (process.env.NODE_ENV === 'production') {
  module.exports.plugins = (module.exports.plugins || []).concat([
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: '"production"'
      }
    }),
    new webpack.optimize.UglifyJsPlugin({
      sourceMap: true,
      compress: {
        warnings: false
      }
    }),
    new webpack.LoaderOptionsPlugin({
      minimize: true
    })
  ])
}
