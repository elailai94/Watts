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
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("../images/#{@heading_edited}_large.png")
    
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
          {'Angular velocity v1' => 'Angular velocity = linear velocity / radius',
           'Angular velocity v2' => 'Angular velocity = 2π x frequency of rotation',
           'Angular acceleration' => 'Angular acceleration = (final angular velocity - initial angular velocity) / time'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @centripetal_acceleration_v1 = para('Centripetal acceleration = linear velocity',
                                              sup('2'), ' / radius')
          @centripetal_acceleration_v1.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/centripetal_acceleration_v1_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @centripetal_acceleration_v2 = para('Centripetal acceleration = angular velocity',
                                              sup('2'), ' x radius')
          @centripetal_acceleration_v2.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/centripetal_acceleration_v2_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @centripetal_force_v1 = para('Centripetal force = (mass x linear velocity',
                                       sup('2'), ') / radius')
          @centripetal_force_v1.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/centripetal_force_v1_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @centripetal_force_v2 = para('Centripetal force = mass x angular velocity',
                                       sup('2'), ' x radius')
          @centripetal_force_v2.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/centripetal_acceleration_v2_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @angular_momentum = para('Angular momentum = moment of inertia x angular velocity')
          @angular_momentum.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/angular_momentum_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @angular_kinetic_energy = para('Angular kinetic energy = 0.5 x moment of inertia x angular velocity',
                                         sup('2'))
          @angular_kinetic_energy.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/angular_kinetic_energy_screen")
          end
        end
      end
    end
  end

end
