#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TitleScreenHeader objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Title screen header module (title_screen_header.rb)

require_relative 'element.rb'

# Object definition
class TitleScreenHeader < Element
  
  # Initializes the object.
  # @param app []
  # @param path [String]
  # @return [TitleScreenHeader]
  def initialize(app, colour, path)
  	super(app, 'Title Screen', 'Header')
  	@app.flow(:height => 80, :width => 1080, :scroll => false) do
  	  @app.background(colour)
  	  @app.image(path,
  		           :height => 60,
  		           :width => 298,
  		           :top => 10,
  		           :left => 10)
  	end
  end

end
