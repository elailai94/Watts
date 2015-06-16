#==============================================================================
# Watts
#
# @description: Program for performing Physics formula calculations
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Main program (main.rb)

# Installs the required Ruby gem
Shoes.setup do 
  gem 'joules'
end

require 'joules'
require '../Splash-Screen/splash_screen'
require '../Title-Screen/title_screen'
require '../Constants-Screen/constants_screen'

Shoes.app(:title => 'Watts', :height => 720, :width => 1080, :resizable => false)
