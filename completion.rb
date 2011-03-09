#!/usr/bin/env ruby

module Completion
  def self.build(args)
    index = args[0].to_i
    words = args[1..-1]
    current = words[index]
    choices = yield words, index
    puts choices.select { |w| w.start_with?(current) }.join(" ")
  end

  def self.register(command)
    `complete -F _ruby_complete #{command}`
  end
end

if __FILE__ == $0
  if File.file?(File.join(ENV["RUBY_COMPLETE_DIR"], ARGV[1] + ".rb"))
  end
end
