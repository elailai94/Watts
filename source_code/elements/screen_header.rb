#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ScreenHeader objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Screen header module (screen_header.rb)

require_relative 'element.rb'

# Object definition
class ScreenHeader < Element

  # Initializes the object.
  def initialize(app, previous_url, font, heading)
  	@heading_edited = heading.split('=')[0].strip
    super(app, "#{@heading_edited} screen", 'Header')
    @app.flow(:height => 80, :width => 1080, :scroll => false) do
      @app.image('../images/back_icon_white.png',
      	         :height => 50,
      	         :top => 15,
      	         :left => 15,
      	         :click => previous_url)
      @app.title(heading,
      	         :top => 4,
      	         :left => 80,
      	         :font => font,
      	         :stroke => @app.rgb(255, 255, 255))
    end
  end
	
end
