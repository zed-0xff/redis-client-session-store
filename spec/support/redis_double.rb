# frozen_string_literal: true

def redis_double **args
  r = double('redis')
  args.each do |k, v|
    allow(r).to receive(:call).with(k.to_s.upcase, anything).and_return(v)
  end
  r
end
