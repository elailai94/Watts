#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TitleScreen objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Title screen module (title_screen.rb)

require 'elements/title_screen_header'
require 'elements/title_screen_image'

# Object definition
class TitleScreen < Shoes
  
  url('/title_screen', :title_screen)

  # Draws the title screen on the Shoes app window.
  def title_screen
    # Title screen header
    TitleScreenHeader.new(self, @@theme_colour, '../images/watts_logo_white.png')
    
    # Title screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      background(ghostwhite)
      @image_names = ['constants', 'kinematics', 'circular_motion',
        'mass_weight', 'density', 'forces', 'momentum_impulse',
        'energy_work_power', 'stress_strain', 'pressure',
        'thermodynamics', 'waves', 'oscillations', 'electricity',
        'quantum', 'gravitational_fields', 'electric_fields',
        'magnetic_fields', 'geometry', 'conversions']
      @image_names.each do |image_name|
        TitleScreenImage.new(self, image_name)
      end
    end
  end

end
