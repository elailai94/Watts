#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ScreenBox objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Screen box module (screen_box.rb)

require_relative 'element.rb'

# Object definition
class ScreenBox < Element
	
  # Initializes the object.
  def initialize(app, colour, font, heading, text)
    super(app, "#{heading} screen", 'Header')
    @text_edited = text.split('=')[0].strip.sub(' ','_').downcase
    @box_link = "/title_screen/#{heading.downcase}_screen/#{@text_edited}_screen"
    @app.stack(:height => 100, :width => 940, :margin => 2) do
      @app.background(colour)
      @app.para(text,
      	        :top => 24,
      	        :left => 10,
      	        :font => font,
      	        :size => 20,
      	        :stroke => @app.rgb(255, 255, 255))
      @app.click do
        @app.visit(@box_link)
      end
    end
  end

end
