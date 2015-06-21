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
require_relative '../elements/screen_box.rb'

# Object definition
class KinematicsScreen < Shoes

  url('/title_screen/kinematics_screen', :kinematics_screen)

  # Draws the kinematics screen on the Shoes app window.
  def kinematics_screen
    @heading = 'Kinematics'
    background("../images/#{@heading.downcase}_large.jpg", :height => 750, :width => 1080)
    
    # Kinematics screen header
    ScreenHeader.new(self, @@font, @heading)

    # Kinematics screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 850, :width => 80) do
      end
      # First content column 
      stack(:height => 850, :width => 1000) do
        @formula_set =
          ['Average speed = distance / time',
           'Average velocity = displacement / time',
           'Acceleration = (final velocity - initial velocity) / time',
           'Final velocity = initial velocity + (acceleration × time)']
        @formula_set.each do |formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula)
        end
        @screen_box_text_styles = {:top => 24,
                                   :left => 10,
                                   :font => @@font,
                                   :size => 20,
                                   :stroke => rgb(255,255,255)}
        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @final_velocity = para('Final velocity = (initial velocity', sup('2'),
          	                     ' + (2 × acceleration × displacement))', sup('0.5'))
          @final_velocity.style(@screen_box_text_styles)
        end
        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @displacement_v1 = para('Displacement = 0.5 × (initial velocity + final velocity) × time')
          @displacement_v1.style(@screen_box_text_styles)
        end
        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @displacement_v2 = para('Displacement = (initial velocity × time) + (0.5 × acceleration × time',
          	                      sup('2'), ')')
          @displacement_v2.style(@screen_box_text_styles)
        end
        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @displacement_v3 = para('Displacement = (final velocity × time) - (0.5 × acceleration × time',
          	                      sup('2'), ')')
          @displacement_v3.style(@screen_box_text_styles)
        end
      end
    end
  end

end
