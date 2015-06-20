#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TitleScreenImage
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Title screen image module (title_screen_image.rb)

require_relative 'element.rb'

# Object definition
class TitleScreenImage < Element
  
  # Initializes the object.
  # @param path [String]
  # @param top [Int, Float]
  # @param left [Int, Float]
  # @return [TitleScreenImage]
  def initialize(app, name)
    super(app, 'Title Screen', 'Image')
    @image_path = "../images/#{name}.png"
    @image_link = "/title_screen/#{name}_screen"
    @app.image(@image_path,
               :height => 160,
               :width => 216,
               :margin => 2,
               :click => @image_link)
  end
	
end
