# frozen_string_literal: true

# Shamelessly ripped from Ryan Bates' dotfile installer:
# https://github.com/ryanb/dotfiles/blob/ce2f57/Rakefile
require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  switch_to_zsh

  replace_all = false
  files = Dir['*'] - %w[Rakefile README LICENSE]
  files.each do |file|
    system(%(mkdir -p "$HOME/.#{File.dirname(file)}")) if file =~ %r{ /\// }
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical?(file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          puts 'LIKE A BOSS'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %(rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}")
  link_file(file)
end

def link_file(file)
  if file =~ %r{ /.erb$/ }
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %(ln -s "$PWD/#{file}" "$HOME/.#{file}")
  end
end

def switch_to_zsh
  puts 'switching to zsh'
  if ENV['SHELL'] =~ /zsh/
    puts 'tah-done'
  elsif %x(which zsh).chomp =~ /zsh/
    system %(chsh -s $(which zsh))
  else
    puts 'skipping zsh'
  end
end
