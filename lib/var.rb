
def set_vars
  #$upc_path = "#{Dir.home()}/IBT/jewelry/upc"
  $upc_path = Dir.pwd()
  $templates_path = "#{$upc_path}/lib/templates"

  $template_top = File.open("#{$templates_path}/template-top.txt").readlines
  $template_bottom = File.open("#{$templates_path}/template-bottom.txt").readlines
  
  $query_list = ["gauge","size","type","material","id"]
  $types = {
    "cve"=>"Curved Barbell EXT",
    "cvi"=>"Curved Barbell INT",
    "cbr"=>"Captive Bead Ring",
    "fbr"=>"Fixed Bead Ring",
    "hse"=>"Circular Barbell",
    "hsec"=>"Circ.Barbell w/ Cones",
    "bre"=>"Barbell",
    "lbe"=>"Labret EXT",
    "lbi"=>"Labret INT"
  }
  
  $materials = {
    "316"=>"316 LVM IGSS",
    "steel"=>"316 LVM IGSS",
    "st"=>"316 LVM IGSS",
    "tit"=>"Titanium",
    "ti"=>"Titanium",
    "ac"=>"Acrylic",
    "wood"=>"Wood",
    "ni"=>"Niobium",
    "nio"=>"Niobium"
  }
  $pdfdir = "#{$upc_path}/pdfs"
end

set_vars

