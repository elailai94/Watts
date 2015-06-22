#==============================================================================
# Watts
#
# @description: Program for performing Physics formula calculations
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Main program (main.rb)

# Installs the required Ruby gem.
Shoes.setup do 
  gem 'joules'
end

require 'joules'
require 'screens/splash_screen'
require 'screens/title_screen'
require 'screens/constants_screen'
require 'screens/kinematics_screen'
require 'screens/kinematics-screens/average_speed_screen'
require 'screens/circular_motion_screen'

# Stores Shoes app user interface properties.
class Shoes
  @@theme_colour = Shoes.rgb(220, 20, 60)
  @@font = 'Segoe UI'
  @@screen_box_text_styles = {:top => 24,
  	                          :left => 10,
  	                          :font => @@font,
  	                          :size => 20,
  	                          :stroke => rgb(255, 255, 255)}
  @@screen_unit_text_styles = {:font => @@font,
  	                           :size => 12,
  	                           :stroke => rgb(255, 255, 255)}
  @@screen_result_text_styles = {:font => @@font,
  	                             :size => 25,
  	                             :stroke => rgb(255, 255, 255)}
end

# Initializes a Shoes app window.
Shoes.app(:title => 'Watts',
	  :height => 720,
	  :width => 1080,
	  :resizable => false)
