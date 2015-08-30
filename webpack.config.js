var webpack = require('webpack')
var path = require('path')

module.exports = {
    entry: {
        bundle: ["!bootstrap-webpack!./assets/bootstrap.config.js",
                "font-awesome-webpack!./assets/font-awesome.config.js",
                "./assets/js/entry.cjsx"]
    },

    output: {
        path: __dirname + "/static",
        publicPath: "",
        filename: "js/[name].js",
        chunkFilename: "js/[id].js",
    },

    resolve: {
        modulesDirectories: ["node_modules", "assets"],
        fallback: ["./assets"],
        extensions: ['', '.js', '.cjsx', '.coffee'],
    },

    module: {
        loaders: [
            { test: /\.css/, loader: "style-loader!css-loader" },
            { test: /\.less$/, loader: "style-loader!css-loader!less-loader" },
            { test: /\.png/, loader: "url-loader?limit=10000&mimetype=image/png" },

            // **IMPORTANT** This is needed so that each bootstrap js file required by
            // bootstrap-webpack has access to the jQuery object
            { test: /bootstrap\/js\//, loader: 'imports?jQuery=jquery' },
            
            
            {test: /\.jsx$/, loader: "jsx-loader?harmony" },
            { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
            { test: /\.coffee$/, loader: 'coffee' },

            { test: /\.woff(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&mimetype=application/font-woff" },
            { test: /\.woff2(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&mimetype=application/font-woff2" },
            { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader" },
        ]
    }, 

    plugins: [
        new webpack.IgnorePlugin(/vertx/)
    ]
}
