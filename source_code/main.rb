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

# Stores Shoes app user interface properties.
class Shoes
  @@theme_colour = Shoes.rgb(220, 20, 60)
  @@font = 'Segoe UI'
end

# Initializes a Shoes app window.
Shoes.app(:title => 'Watts',
	  :height => 720,
	  :width => 1080,
	  :resizable => false)
