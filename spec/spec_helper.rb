require 'simplecov'
require_relative 'support'
require 'redis-client-session-store'

# from git submodule
require_relative 'support/redis-client/test/support/servers'
require_relative 'support/redis_double'

unless ENV['REDIS_URL']
  class TestRedisManager < Servers::RedisManager
    # workaround for "Failed opening Unix socket: unix socket path too long"
    def command
      super - ['--unixsocket', Servers::REDIS_SOCKET_FILE.to_s]
    end
  end

  Dir.mkdir('tmp') unless Dir.exist?('tmp')
  Servers.build_redis
  REDIS = TestRedisManager.new(
    'redis',
    port: 16_380,
    real_port: 16_380
  )
  TEST_SERVERS = ServerList.new(REDIS)
  TEST_SERVERS.prepare

  ENV['REDIS_URL'] = "redis://#{REDIS.host}:#{REDIS.port}"

  RSpec.configure do |config|
    config.after(:suite) { TEST_SERVERS.shutdown }
  end
end
