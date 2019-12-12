require 'fileutils'
puts "##################################################################"
puts "                    Ruby Project Creator"
puts "##################################################################"
puts "Enter the Name of the Project you Want to Create"
input = gets.chomp.downcase.gsub(" ", '-')
puts "Enter a Class Name"
class_name = gets.chomp.capitalize
FileUtils.mkdir_p "#{input}/lib"
FileUtils.mkdir_p "#{input}/spec"
File.open("#{input}_spec.rb","w") { |file| file.puts "require('rspec')
require('#{input}')

describe ('##{class_name}') do
  it('should...'' ) do
    expect().to(eq())

  end
end"}
File.open("#{input}.rb","w") { |file| file.puts "class #{class_name}
  def initialize()

  end
end"}
File.open("Gemfile", "w") { |file| file.puts "source 'https://rubygems.org'

gem 'rspec'
gem 'pry'"}
FileUtils.mv "Gemfile", "#{input}"
FileUtils.mv "#{input}.rb", "#{input}/lib"
FileUtils.mv "#{input}_spec.rb", "#{input}/spec"
print "Your Project Has Been Created!
"
