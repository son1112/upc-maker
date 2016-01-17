#!/usr/bin/ruby

load './lib/var.rb'
load './lib/upc_classes'

Dir.chdir($pdfdir)

$sheets_dir = "#{$pdfdir}/sheets"
$labels_dir = "#{$pdfdir}/labels"

$sheet_top = File.open("#{$pdfdir}/templates/labelsTemplate-top.txt").readlines

files = Dir.entries(".").reject { |entry| File.directory?(entry) }
$pdfs = files.select { |file| file.end_with? '.pdf' }
label_count = $pdfs.count



def get_rows
  fboxs = []
      
  $pdfs.each do |pdf|
    fboxs.push "\\framebox[1.0\\width]{\\includegraphics{labels/#{pdf}}}"
  end
  
  rows = fboxs.each_slice(4).to_a
  
  return rows
end

def get_sheets
  pages = []

  get_rows.each do |row|
    pages.push row
  end
  
  sheets = pages.each_slice(8).to_a

  return sheets
end

sheet_count = get_sheets.count

if sheet_count >= 1
    
    sheets = get_sheets

    i = 0

    sheets.each do |page|

      Dir.chdir($sheets_dir)
      
      name = "sheet_000#{i}"
      filename = "#{name}.tex" 
      
      File.open(filename, "w") do |file|
        file.puts $sheet_top
        file.puts "\\begin{center}"
        file.puts "\\setlength{\\fboxsep}{1pt}"
        file.puts "\\setlength{\\fboxrule}{0.1pt}"
      end
      
      page.each do |row|
        File.open(filename, "a") do |file|
          
          file.puts row
          file.puts "\\newline"

          row.each do |box|
            pdf = box.split("{").last.split("}").first.split("/").last
            `mv ../#{pdf} #{$labels_dir}`
          end
        end
      end

      File.open(filename, "a") do |file|
        file.puts "\\end{center}"
        file.puts "\\end{document}"
      end

      i += 1
      
      `pdflatex #{filename} && evince #{name}.pdf && mv *.aux *.log *.out *.tex texfiles`
    end

end
