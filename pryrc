#require 'get_process_mem'

::Pry.config.editor = 'vim'
#::Pry.config.prompt = ::Pry::NAV_PROMPT
#::Pry.config.prompt = ::Pry::Prompt[:nav]

class ::Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end

def print_mem_usage(description)
  mb = ::GetProcessMem.new.mb
  puts "#{description} - MEMORY USAGE(MB): #{mb.round}"
end

def print_mem_usage_before_and_after
  print_mem_usage('Before')
  yield
  print_mem_usage('After')
end
