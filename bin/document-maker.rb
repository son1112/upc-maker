#!/usr/bin/ruby

def get_templates
  types = {1=>"label",2=>"resume",3=>"document",4=>"invoice"}
  return types
end

def item_type(sel)
  type = get_templates[sel]
  return type
end

def item_template
  puts "Please choose: "
  puts ""
  
  get_templates.each do |type|
    a = type[0]
    b = type[1].capitalize

    puts "#{a}) #{b} "
    #puts "1) Labels 2) Resume"
    puts ""
  end

  sel = gets.chomp.to_i

  item_type(sel)
end

def item_prod_num
  type = item_template

  puts ""
  puts "How many #{type.capitalize}s?"
  puts ""
  return gets.chomp.to_i
end
