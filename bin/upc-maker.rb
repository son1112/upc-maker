#!/usr/bin/ruby

require './lib/var.rb'
load './lib/upc_classes'

Dir.chdir($upc_path)

def labels_num
  puts "How many labels?\n"
  return gets.chomp.to_i
end

def main(list)

  @label = Label.new(list)

  labels_num.times do
  
    @label.to_tex_file

    `pdflatex #{@label.tex_file} && evince #{@label.query_hash['id']}.pdf &`
    `mv *.aux *.log *.out *.tex texfiles && mv *.pdf pdfs`
    
  end
end

main($query_list)

