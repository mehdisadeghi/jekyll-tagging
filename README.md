# jekyll-tagging-lite [![Gem Version](https://badge.fury.io/rb/jekyll-tagging-lite.svg)](https://badge.fury.io/rb/jekyll-tagging-lite)

Re-published to rubygems as `jekyll-tagging-lite` by @mehdisadeghi.

I have merged some waiting PRs and also made a change to cache the tag_cloud function's result which
signifcantly increases build time (from 12s down to 5s) on my [website](https://github.com/mehdisadeghi/mehdix.ir).

Moreover, I restructed the files so one can simple add `gem jekyll-tagging-lite` to Gemfile and is done. No need to
requiring `jekyll/tagging` (was annoying for me).

For the list of changes made to the upstream see the commit history.

The instructions below remain the same, except for the gem name and the requiring part.

## Note on Forking
All the credit goes to the original authors, Arne and Jens, and other contributors. Thank you! The purpose of this fork is mainly
making my own website faster. In case the upstream shows interest I'll submit a PR of my changes. However, the upstream looks stale
to me (dangling PRs and not responding to issues). Again, thanks for creating jekyll-tagging!

# jekyll-tagging

By Arne Eilermann <mailto:arne@kleinerdrei.net> and Jens Wille <mailto:jens.wille@uni-koeln.de>

jekyll-tagging is a Jekyll plugin, to add a tag cloud and per tag pages plus feeds to your Jekyll generated Website.

## Tags
This plugin does not reinvent Jekyll's tagging feature. It just makes it easy to use.
<https://jekyllrb.com/docs/frontmatter/>

Add space-delimited lowercase tags to FrontMatter, e.g.

  ~~~~
  author: Willow Rosenberg
  tags: feminism anti-capitalism witchcraft
  ~~~~

## Usage

Install it:

    gem install jekyll-tagging

Add this line to your Jekyll project's Gemfile:

    group :jekyll_plugins do
      gem "jekyll-tagging-lite"
    end

And in your `_config.yml` you have to define your layout used to generate tag pages like:

    tag_page_layout: tag_page
    tag_page_dir: tag

This will look for `_layouts/tag_page.html`>, and use it to generate tag pages into the `_site/tag` directory.

Now you have a new filter called `tag_cloud` which you can use with the `site` object as argument in your layout to get a cloud of all your site's tags. The tags are linked to their related tag page. Furthermore, you have a `tags` filter which you can feed with a `post` or a `page` object to get a link list of all its tags.

You can optionally define a per tag Atom/RSS feed.  In your `_config.yml` define the following:

  tag_feed_layout: tag_feed
  tag_feed_dir: tag

(`tag_page_dir` and `tag_feed_dir` can have the same value.)

### Pretty page links

If your Jekyll `permalink` configuration is set to something other than `:pretty`, and you still want to have pretty tag links define the following in your `_config.yml`:

    tag_permalink_style: pretty

### Ignoring tags

Sometimes you don't want tag pages generated for certain pages. That's ok! Just add `ignored_tags: [tags,to,ignore]` to your `_config.yml`

### Extra data on tag pages

You can attach extra data to generated tag pages by specifying `tag_page_data` in `_config.yml` (this also works for `tag_feed_data`). For example, you might want to exclude tag pages from being picked up by `jekyll-sitemap`:

    tag_page_data:
      sitemap: false

### Example tag page layout

(Save this to `_layouts/tag_page.html` if using the `_config.yml` snippet above.)

~~~~
  ---
  layout: default
  ---
  <h2>{{ page.tag }}</h2>
  <ul>
  {% for post in page.posts %}
    <li><a href#"{{ post.url }}">{{ post.title }}</a> ({{ post.date | date_to_string }} | Tags: {{ post | tags }})</li>
  {% endfor %}
  </ul>

  <div id#"tag-cloud">
    {{ site | tag_cloud }}
  </div>
~~~~

### Example layout of an Atom feed

(Save this to `_layouts/tag_feed.xml` if using the `_config.yml` snippet above.)

~~~~
  ---
  layout: nil
  ---
  <?xml version#"1.0" encoding#"utf-8"?>
  <feed xmlns#"http://www.w3.org/2005/Atom">
   <title>Your Title - {{ page.tag }}</title>
   <link href#"http://example.com{{ page.url }}" rel#"self"/>
   <link href#"http://example.com/tag/{{ page.tag }}.html"/>
   <updated>{{ site.time | date_to_xmlschema }}</updated>
   <id>http://example.com/tag/{{ page.tag }}.html</id>
   <author>
     <name>Author Here</name>
   </author>
   {% for post in page.posts %}
   <entry>
     <title>{{ post.title }}</title>
     <link href#"http://example.com{{ post.url }}"/>
     <updated>{{ post.date | date_to_xmlschema }}</updated>
     <id>http://example.com{{ post.id }}</id>
     <content type#"html">{{ post.content | xml_escape }}</content>
   </entry>
   {% endfor %}
  </feed>
~~~~

## Links

Documentation:: <http://rubydoc.info/gems/jekyll-tagging/frames>
Source code:: <http://github.com/pattex/jekyll-tagging>
RubyGem:: <http://rubygems.org/gems/jekyll-tagging>

## License

### The MIT License

Copyright (c) 2010-2012 University of Cologne,
Albertus-Magnus-Platz, 50923 Cologne, Germany

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
