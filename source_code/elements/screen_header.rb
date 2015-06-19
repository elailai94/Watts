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
  def initialize(app, colour, title)
    super(app, "#{title} Screen", 'Header')
    @app.flow(:height => 80, :width => 1080, :scroll => false) do
      @app.background(colour)
      @app.image('../images/back_icon_white.png',
      	         :height => 50,
      	         :top => 15,
      	         :left => 15,
      	         :click => '/title_screen')
      @app.title(title,
      	         :top => 4,
      	         :left => 80,
      	         :font => 'Segoe UI',
      	         :stroke => rgb(255,255,255))
    end
  end
	
end
