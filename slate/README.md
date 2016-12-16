Ikcrm Api Doc
========
> build with Slate

*The example above was created with Slate. Check it out at [tripit.github.io/slate](http://tripit.github.io/slate).*

Features
------------

* **Clean, intuitive design**

* **Everything on a single page**

* **Slate is just Markdown**

* **Write code samples in multiple languages**

* **Out-of-the-box syntax highlighting**

* **Automatic, smoothly scrolling table of contents**

* **Let your users update your documentation for you**

Getting Started with Slate
------------------------------

- [wiki](https://github.com/tripit/slate/wiki)

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

 1. Fork this repository on Github.
 2. Clone *your forked repository* (not our original one) to your hard drive with `git clone ssh://gitlab@gitlab.ikcrm.com:40022/ikcrm_server/ikcrm_api_doc.git`
 3. `cd slate`
 4. Install all dependencies: `bundle install`
 5. Start the test server: `bundle exec middleman server`

### Generate or Update

```shell
rake build    # Compile all files into the build directory
rake clean    # Remove any temporary products
rake clobber  # Remove any generated file
rake publish  # Build and publish to Github Pages
```

Or use the included Dockerfile! (must install Docker first)

```shell
docker build -t slate .
docker run -d -p 4567:4567 slate
```

You can now see the docs at <http://localhost:4567>. Whoa! That was fast!

*Note: if you're using the Docker setup on OSX, the docs will be
availalable at the output of `boot2docker ip` instead of `localhost:4567`.*

Now that Slate is all set up your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/tripit/slate/wiki/Deploying-Slate).

Contributors
--------------------

Slate was built by [Robert Lord](https://lord.io) while at [TripIt](http://tripit.com).

Special Thanks
--------------------
- [Middleman](https://github.com/middleman/middleman)
- [jquery.tocify.js](https://github.com/gfranko/jquery.tocify.js)
- [middleman-syntax](https://github.com/middleman/middleman-syntax)
- [middleman-gh-pages](https://github.com/neo/middleman-gh-pages)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
