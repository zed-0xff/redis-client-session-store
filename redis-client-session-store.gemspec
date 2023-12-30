Gem::Specification.new do |gem|
  gem.name = 'redis-client-session-store'
  gem.authors = ['Andrey "Zed" Zaikin']
  gem.email = ['zed.0xff@gmail.com']
  gem.summary = 'Rails session store using low-level redis-client for Redis 6+'
  gem.description = "#{gem.summary} For great glory!"
  gem.homepage = 'https://github.com/zed-0xff/redis-client-session-store'
  gem.license = 'MIT'

  gem.extra_rdoc_files = %w(LICENSE AUTHORS.md CONTRIBUTING.md)

  gem.files = `git ls-files -z`.split("\x0")
  gem.require_paths = %w(lib)
  gem.version = File.read('lib/redis-client-session-store.rb')
                    .match(/^  VERSION = '(.*)'/)[1]

  gem.add_runtime_dependency 'actionpack', '>= 5.2.4.1', '< 8'
  gem.add_runtime_dependency 'redis-client'

  gem.add_development_dependency 'rake', '~> 13'
  gem.add_development_dependency 'rspec', '~> 3'
  gem.add_development_dependency 'rubocop', '~> 1.25'
  gem.add_development_dependency 'rubocop-rake', '~> 0.6'
  gem.add_development_dependency 'rubocop-rspec', '~> 2.8'
  gem.add_development_dependency 'simplecov', '~> 0.21'
end
