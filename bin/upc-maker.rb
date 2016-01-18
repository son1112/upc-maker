#!/usr/bin/ruby

require './lib/var.rb'
load './lib/upc_classes'
load './bin/document-maker.rb'

Dir.chdir($upc_path)

def main(list)

  @label = Label.new(list)

  item_prod_num.times do
  
    @label.to_tex_file

    `pdflatex #{@label.tex_file} && evince #{@label.query_hash['id']}.pdf && mv *.aux *.log *.out *.tex texfiles && mv *.pdf pdfs`
    
  end
end

main($query_list)

