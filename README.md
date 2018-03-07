# Sport Places API documentation

These docs are powered by [Slate](https://github.com/lord/slate). Slate produces plain old static HTML files after
compilation with Middleman. It is these HTML files that we publish on the Internet. This repository itself should not be
deployed anywhere, because of performance and security concerns.

## Markdown

The documentation is written in Markdown. For more information see
[the Markdown spec](https://daringfireball.net/projects/markdown/syntax).

Some HTML is also permitted, but keep it simple.

## Running a local instance

```shell
bundle install
bundle exec middleman server
```

You can now see the docs at [http://localhost:4567](http://localhost:4567)

## Deploying

These docs are hosted on Heroku at: 
[https://sportplaces-docs.herokuapp.com/index.html](https://sportplaces-docs.herokuapp.com/index.html)

1) Install and configure the [Heroku CLI tools](https://devcenter.heroku.com/articles/heroku-cli) on your machine
2) Authenticate to Heroku using `heroku login`
3) Add the Git remote to the `build` submodule:
```shell
cd build
git remote add heroku https://git.heroku.com/sportplaces-docs.git
cd ..
```
4) Execute the `./build.sh` script to automatically build and deploy your changes to Heroku
