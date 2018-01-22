#https://github.com/rtomayko/tilt/blob/master/lib/tilt/template.rb

module BangBang
  class Template < ::Tilt::Template
    def prepare
      #...
    end

    def evaluate(scope, locals, &block)
      "#{data}!"
    end
  end
end

Sprockets.register_engine '.bang', BangBang::Template

