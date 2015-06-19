#==============================================================================
# Watts
#
# @description: Module for providing functions to work with SplashScreenImage objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Splash screen image module (splash_screen_image.rb)

require_relative 'element.rb'

# Object definition
class SplashScreenImage < Element

  # Initializes the object.
  def initialize(app, path)
	super(app, 'Splash Screen', 'Image')
	@app.image(path,
		       :top => 310,
		       :left => 292)
  end
	
end
