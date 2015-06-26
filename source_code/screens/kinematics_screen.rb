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

require_relative 'kinematics-screens/average_speed_screen.rb'
require_relative 'kinematics-screens/average_velocity_screen.rb'
require_relative 'kinematics-screens/acceleration_screen.rb'
require_relative 'kinematics-screens/final_velocity_v1_screen.rb'
require_relative 'kinematics-screens/final_velocity_v2_screen.rb'
require_relative 'kinematics-screens/displacement_v1_screen.rb'
require_relative 'kinematics-screens/displacement_v2_screen.rb'
require_relative 'kinematics-screens/displacement_v3_screen.rb'

# Object definition
class KinematicsScreen < Shoes

  url('/title_screen/kinematics_screen',
      :kinematics_screen)

  # Draws the kinematics screen on the Shoes app window.
  def kinematics_screen
    @heading = 'Kinematics'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("../images/#{@heading_edited}_large.png")

    # Kinematics screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Kinematics screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 850, :width => 80) do
      end
      # Content column
      stack(:height => 850, :width => 1000) do
        @formula_set =
          {'Average speed' => 'Average speed = distance / time',
           'Average velocity' => 'Average velocity = displacement / time',
           'Acceleration' => 'Acceleration = (final velocity - initial velocity) / time',
           'Final velocity v1' => 'Final velocity = initial velocity + (acceleration × time)'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @final_velocity_v2 = para('Final velocity = (initial velocity', sup('2'),
                                 ' + (2 × acceleration × displacement))', sup('0.5'))
          @final_velocity_v2.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/final_velocity_v2_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @displacement_v1 = para('Displacement = 0.5 × (initial velocity + final velocity) × time')
          @displacement_v1.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/displacement_v1_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @displacement_v2 = para('Displacement = (initial velocity × time) + (0.5 × acceleration × time',
                                  sup('2'), ')')
          @displacement_v2.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/displacement_v2_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @displacement_v3 = para('Displacement = (final velocity × time) - (0.5 × acceleration × time',
                                  sup('2'), ')')
          @displacement_v3.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/displacement_v3_screen")
          end
        end
      end
    end
  end

end
