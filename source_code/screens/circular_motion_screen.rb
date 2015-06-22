#==============================================================================
# Watts
#
# @description: Module for providing functions to work with CircularMotionScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Circular motion screen module (circular_motion_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

# Object definition
class CircularMotionScreen < Shoes

  url('/title_screen/circular_motion_screen', :circular_motion_screen)

  def circular_motion_screen
    @heading = 'Circular motion'
    background("../images/#{@heading.downcase.sub(' ','_')}_large.png")
    
    # Circular motion screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Circular motion screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 950, :width => 80) do
      end
      # Content column 
      stack(:height => 950, :width => 1000) do
        @formula_set =
          ['Angular velocity = linear velocity / radius',
           'Angular velocity = 2π x frequency of rotation',
           'Angular acceleration = (final angular velocity - initial angular velocity) / time']
        @formula_set.each do |formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @centripetal_acceleration_v1 = para('Centripetal acceleration = linear velocity',
          	                                  sup('2'), ' / radius')
          @centripetal_acceleration_v1.style(@@screen_box_text_styles)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @centripetal_acceleration_v2 = para('Centripetal acceleration = angular velocity',
          	                                  sup('2'), ' x radius')
          @centripetal_acceleration_v2.style(@@screen_box_text_styles)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @centripetal_force_v1 = para('Centripetal force = (mass x linear velocity',
          	                           sup('2'), ') / radius')
          @centripetal_force_v1.style(@@screen_box_text_styles)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @centripetal_force_v2 = para('Centripetal force = mass x angular velocity',
          	                           sup('2'), ' x radius')
          @centripetal_force_v2.style(@@screen_box_text_styles)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @angular_momentum = para('Angular momentum = moment of inertia x angular velocity')
          @angular_momentum.style(@@screen_box_text_styles)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @angular_kinetic_energy = para('Angular kinetic energy = 0.5 x moment of inertia x angular velocity',
          	                             sup('2'))
          @angular_kinetic_energy.style(@@screen_box_text_styles)
        end
      end
    end
  end

end
