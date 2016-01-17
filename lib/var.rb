
def set_vars
  $upc_path = "#{Dir.home()}/IBT/jewelry/upc"
  $templates_path = "#{$upc_path}/lib/templates"
  $template_top = File.open("#{$templates_path}/template-top.txt").readlines
  $template_bottom = File.open("#{$templates_path}/template-bottom.txt").readlines
  
  $query_list = ["gauge","size","type","material","id"]
  $types = {"cve"=>"Curved Barbell","cbr"=>"Captive Bead Ring","hse"=>"Circular/Horseshe Barbell","bre"=>"Barbell","lbe"=>"Labret"}
  
  $materials = {"316"=>"316 LVM IGSS","tit"=>"Titanium","ac"=>"Acrylic","wood"=>"Wood","ni"=>"Niobium"}
  $pdfdir = "#{$upc_path}/pdfs"
end

set_vars

