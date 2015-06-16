#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TitleScreen objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Title screen module (title_screen.rb)

# Object definition
class TitleScreen < Shoes
  
  url('/title_screen', :title_screen)

  # Draws the title screen on the Shoes app window.
  def title_screen
  	background(ghostwhite)
    # Title screen heading
    flow(:height => 80, :width => 1080, :scroll => false) do
      image('../../Images/watts_logo_black.png', :height => 60, :top => 10, :left => 10)
    end
    # Title screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      @image_name_list = ['constants.png', 'kinematics.png', 'circular_motion.png',
      	'mass_weight.png', 'density.png', 'forces.png', 'momentum_impulse.png',
        'energy_work_power.png', 'stress_strain.png', 'pressure.png',
        'thermodynamics.png', 'waves.png', 'oscillations.png', 'electricity.png',
        'quantum.png', 'gravitational_fields.png', 'electric_fields.png',
        'magnetic_fields.png', 'geometry.png', 'conversions.png']
      @image_name_list.each do |image_name|
      	image(('../../Images/' + image_name), :height => 160, :width => 216, 
      	  :margin => 2, :click => '/title_screen/constants_screen')
      end
    end
  end

end
