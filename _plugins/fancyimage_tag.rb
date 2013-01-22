# Title: Fancyimage tag for Jekyll
# Authors: Devin Weaver (photos_tag.rb), Brian M. Clapper (img_popup.rb), Patrick Paul (this gist)
# Description: Takes full size image, automagically creates thumbnail at specified size, +fancybox
#
# Adapted from:
#   http://tritarget.org/blog/2012/05/07/integrating-photos-into-octopress-using-fancybox-and-plugin/
#   (photos_tag.rb) https://gist.github.com/2631877
#   (img_popup.rb) https://github.com/bmc/octopress-plugins/
#
# Syntax {% photo filename [tumbnail] [title] %}
# Syntax {% photos filename [filename] [filename] [...] %}
# If the filename has no path in it (no slashes)
# then it will prefix the `_config.yml` setting `photos_prefix` to the path.
# This allows using a CDN if desired.
#
# To make FancyBox work well with OctoPress You need to include the style fix.
# In your `source/_include/custom/head.html` add the following:
#
#     {% fancyboxstylefix %}
#
# Markup:
#   {% fancyimage right /path/to/image.png 200x100 This is a cool title! %}
#
#   {% fancyalbum 100x100! %}
#   /uploads/image.png: Image caption here
#   /another/upload.png
#   {% endfancyalbum %}
#
# Output:
#   <a href="/path/to/image.png" class="fancybox" title="This is a cool title!">
#   <img class="right" src="/path/to/image200x100.png" alt="This is a cool title!" /></a>
#
# Todo:
#   Figure out how to generate thumbnail images directly into /public/ folder 
#       (instead of to /source/ -> rake generate)
#
# Installation:
#   Forthcoming. Look at the plugins I adapted off of for now.
#   I also aliases 'rake bake' to 'rake generate, rake generate, rake deploy'
#       because the thumbnails only generate -> /public/ the second time around.

require 'digest/md5'
require 'mini_magick'

module Jekyll

  class FancyboxStylePatch < Liquid::Tag
    def render(context)
      return <<-eof
<!-- Fix FancyBox style for OctoPress -->
<style type="text/css">
  .fancybox-wrap { position: fixed !important; }
  .fancybox-opened {
    -webkit-border-radius: 4px !important;
       -moz-border-radius: 4px !important;
            border-radius: 4px !important;
  }
  .fancybox-close, .fancybox-prev span, .fancybox-next span {
    background-color: transparent !important;
    border: 0 !important;
  }
</style>
      eof
    end
  end

  class FancyImageTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      args = markup.strip.split(/\s+/, 4)
      
      raise "Usage: fancyimage img-class filepath 123x456 [title] (input: fancyimage #{markup})" unless [3, 4].include? args.length
    
      @class = args[0]
      @filename = args[1]
      @dimensions = args[2]
      @title = args[3]
      super
    end

    def render(context)    
      # Determine the full path to the source image
      source = Pathname.new(context.registers[:site].source).expand_path
      image_path = source + @filename.sub(%r{^/}, '')
      basename = File.basename(image_path)
      
      # Determine the full path to the thumb image
      #destination = source.sub("#{context.environments.first['site']['source']}","#{context.environments.first['site']['destination']}")
      destination = source # the above line doesnt work -- how can I generate thumbnails into Jekyll public directly?
      image_extension = File.extname(basename)
      safe_dims = (@dimensions).gsub(/!/,"_abs") # replace ! with _abs since filenames can't contain it
      thumb_filename = "thumbs/" + basename.split(".")[0] + "_" + safe_dims + image_extension
      thumb_path = destination + thumb_filename.sub(%r{^/}, '')
      
      # Resize and write the thumbnail image, if it doesn't exist yet
      if not File.exists?(thumb_path)
        thumb = MiniMagick::Image.open(image_path)
        thumb.resize(@dimensions)
        thumb.write(thumb_path)
      end
      
      if @filename
        "<a href=\"#{@filename}\" class=\"fancybox\" title=\"#{@title}\"><img class=\"#{@class}\" src=\"\/#{thumb_filename}\" alt=\"#{@title}\" /></a>"
      else
        "Error processing input, expected syntax: {% fancyimage img-class filename 123x456 [title] %}"
      end
    end
  end

  class FancyAlbumTag < Liquid::Block
    #Sample syntax:
    #{% gallery %}
    #photo1.jpg
    #photo2.jpg[thumb2.jpg] # REMOVED
    #photo3.jpg[thumb3.jpg]: my title 3 # REMOVED
    #photo4.jpg: my title 4
    #{% endgallery %}
    
    def initialize(tag_name, markup, tokens)
      args = markup.strip.split(/\s+/, 4)
      
      raise "Usage: fancyalbum 123x456 (input: fancyalbum #{markup})" unless [1].include? args.length
    
      @dimensions = args[0]
      super
    end

    def render(context)
      lines = "#{@nodelist}" # ["\nimages/midasfull.png: my title 1\nuploads/Fahrenheit451.jpg: my title 2\nimages/midasfull.png: my title 3\n"]
      md5 = Digest::MD5.hexdigest(lines)
      lines = lines.gsub(/^\[/,'')
      lines = lines.gsub(/^\]/,'')
      lines = lines.gsub(/^\"/,'')
      lines = lines.split('\n')
      list = ""

      lines.each do |line|
        if line.length < 3 # this is how we purge empty rows within the tag block
           next
        end
        if /(?<filename>[^\[\]:]+)?(?::(?<title>.*))?/ =~ line          
          # Determine the full path to the source image
          #filename = filename.gsub(/\n/,'')
          source = Pathname.new(context.registers[:site].source).expand_path
          image_path = source + filename.sub(%r{^/}, '')
          basename = File.basename(image_path)
          
          # Determine the full path to the thumb image
          #destination = source.sub("#{context.environments.first['site']['source']}","#{context.environments.first['site']['destination']}")
          destination = source # the above line doesnt work -- how can I generate thumbnails into Jekyll public directly?
          image_extension = File.extname(basename)
	      safe_dims = (@dimensions).gsub(/!/,"_abs") # replace ! with _abs since filenames can't contain it
          thumb_filename = "/thumbs/" + basename.split(".")[0] + "_" + safe_dims + image_extension
          thumb_path = destination + thumb_filename.sub(%r{^/}, '')
          
          # Resize and write the thumbnail image, if it doesn't exist yet
          if not File.exists?(thumb_path)
            thumb = MiniMagick::Image.open(image_path)
            thumb.resize(@dimensions)
            thumb.write(thumb_path)
          end
          list << "<li><a href=\"#{filename}\" class=\"fancybox\" rel=\"gallery-#{md5}\" title=\"#{title.strip}\">"
          list << "<img src=\"#{thumb_filename}\" alt=\"#{title.strip}\" /></a></li>\n"
        end
      end
      "<ul class=\"gallery\">\n#{list}</ul>"
    end
  end

end

Liquid::Template.register_tag('fancyimage', Jekyll::FancyImageTag)
Liquid::Template.register_tag('fancyalbum', Jekyll::FancyAlbumTag)
Liquid::Template.register_tag('fancyboxstylefix', Jekyll::FancyboxStylePatch)
