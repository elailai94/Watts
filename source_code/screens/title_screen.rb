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
    # Title screen heading
    flow(:height => 80, :width => 1080, :scroll => false) do
      background(crimson)
      image('../images/watts_logo_white.png', :height => 60, :top => 10, :left => 10)
    end
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
        @image_path = '../images/#{image_name}.png'
        @image_link = '/title_screen/#{image_name[0..-5]}_screen'
        image(@image_path,
              :height => 160,
              :width => 216,
              :margin => 2,
              :click => @image_link)
      end
    end
  end

end
