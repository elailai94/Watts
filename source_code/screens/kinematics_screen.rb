#==============================================================================
# Watts
#
# @description: Module for providing functions to work with KinematicsScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Kinematics screen module (kinematics_screen.rb)

require_relative '../elements/screen_header.rb'

# Object definition
class KinematicsScreen < Shoes

  url('/title_screen/kinematics_screen', :kinematics_screen)

  # Draws the kinematics screen on the Shoes app window.
  def kinematics_screen
	# Kinematics screen header
	@header = 'Kinematics'
	ScreenHeader.new(self, crimson, @header)	
  end
	
end
