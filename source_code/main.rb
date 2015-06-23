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
require 'screens/kinematics-screens/average_velocity_screen'
require 'screens/kinematics-screens/acceleration_screen'
require 'screens/kinematics-screens/final_velocity_v1_screen'
require 'screens/kinematics-screens/final_velocity_v2_screen'
require 'screens/kinematics-screens/displacement_v1_screen'
require 'screens/circular_motion_screen'
require 'data_validation/data_validation'

# Stores Shoes app user interface properties.
class Shoes
  @@theme_colour = self.rgb(220, 20, 60)
  @@font = 'Segoe UI'
  @@screen_header_image_styles = {:height => 50,
  	                              :top => 15,
  	                              :left => 15}
  @@screen_header_text_styles = {:width => 940,
  	                             :top => 4,
  	                             :left => 80,
                                 :font => @@font,
                                 :stroke => self.rgb(255, 255, 255),
                                 :wrap => 'trim'}
  @@screen_box_text_styles = {:top => 24,
  	                          :left => 10,
  	                          :font => @@font,
  	                          :size => 20,
  	                          :stroke => self.rgb(255, 255, 255)}
  @@screen_unit_text_styles = {:font => @@font,
  	                           :size => 12,
  	                           :stroke => self.rgb(255, 255, 255)}
  @@screen_result_text_styles = {:font => @@font,
  	                             :size => 25,
  	                             :stroke => self.rgb(255, 255, 255)}
  @@screen_error_text_styles = {:font => @@font,
                                :size => 12,
                                :stroke => self.rgb(255, 0, 0)}
end

# Initializes a Shoes app window.
Shoes.app(:title => 'Watts',
	  :height => 720,
	  :width => 1080,
	  :resizable => false)
