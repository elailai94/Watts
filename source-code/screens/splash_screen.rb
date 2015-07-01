#==============================================================================
# Watts
#
# @description: Module for providing functions to work with SplashScreen objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Splash screen module (splash_screen.rb)

require 'source-code/elements/splash_screen_image'

# Object definition
class SplashScreen < Shoes

  url('/',
      :splash_screen)

  # Draws the splash screen on the Shoes app window.
  def splash_screen
    background(crimson)
    SplashScreenImage.new(self, 'images/watts_logo_white.png')
    timer(3) do
      visit('/title_screen')
    end
  end

end
