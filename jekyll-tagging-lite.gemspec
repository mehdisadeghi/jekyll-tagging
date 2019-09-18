# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "jekyll-tagging-lite"
  s.version = "1.2.0"
  s.authors = ["Arne Eilermann", "Jens Wille", "Mehdi Sadeghi"]
  s.email = ["arne@kleinerdrei.net", "jens.wille@uni-koeln.de", "msk1361@gmail.com"]

  s.summary = "Jekyll plugin to automatically generate a tag cloud and tag pages."
  s.homepage = "http://github.com/mehdisadeghi/jekyll-tagging-lite"
  s.licenses = ["MIT"]

  s.require_paths = ["lib"]
  s.extra_rdoc_files = ["ChangeLog"]
  s.files = ["ChangeLog", "README.md", "lib/jekyll-tagging-lite.rb"]
  s.post_install_message = "\njekyll-tagging-lite [2018-03-05]:\n\n* This is jekyll-tagging with some PRs merged and caching. \n\n"
  s.rdoc_options = ["--title", "jekyll-tagging-lite docs", "--line-numbers", "--all", "--main", "ChangeLog"]

  s.add_runtime_dependency "nuggets", "~> 0"

  s.add_development_dependency "bundler", "~> 1.16"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
