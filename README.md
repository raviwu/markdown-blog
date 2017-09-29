# README

[![Build Status](https://travis-ci.org/raviwu/markdown-blog.svg?branch=master)](https://travis-ci.org/raviwu/markdown-blog)

A simple Personal Blog for tech writer. Feature includes:

- Content present with Markdown and syntax highlighter.
- Simple to create new type of content by inherit the Entry class. No need to create new tables for minor difference between content type, aka Post, Page, Ebook, whatever new type of content you want to configure.
- Friendly url, use slug instead of id as the url path.
- Full text search on Post, backed with Postgres full text search.
- Ebook layouts to present media download, cover, description, resources link.
- Static Page can be created and automatically align to the sidebar menu.
- No admin panel design, can just login to website and edit from the front end.

## Framework:

- [Rails 5.1.4](http://rubyonrails.org/)
- [Ruby v2.4.2](https://www.ruby-lang.org/en/)

## Key Feature Gem used:

- Layout CSS with [Bootstrap](http://getbootstrap.com/) & [Font Awesome](http://fontawesome.io/)
- Markdown Parser [redcarpet](https://github.com/vmg/redcarpet)
- Syntax Highlighter [rouge](https://github.com/jneen/rouge)
- Comment System backed by [Disqus](https://disqus.com/)
- Assets managed with [Paperclip](https://github.com/thoughtbot/paperclip)
- Full text search with [pg_search](https://github.com/Casecommons/pg_search)

## Configuration:

Configure the site personal content in the `Setting.yml`.

I was using heroku so there's my personal description in `config/settings/production.yml`, totally fine to remove that and replace with your own content.

Enjoy the site.

## TODO:

- Try better practice the trailblazer structure here.
