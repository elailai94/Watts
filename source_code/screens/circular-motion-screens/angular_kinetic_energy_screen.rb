#==============================================================================
# Watts
#
# @description: Module for providing functions to work with AngularKineticEnergyScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Angular kinetic energy screen module (angular_kinetic_energy_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class AngularKineticEnergyScreen < Shoes

  url('/title_screen/circular_motion_screen/angular_kinetic_energy_screen',
      :angular_kinetic_energy_screen)

  # Draws the angular kinetic energy screen on the Shoes app window.
  def angular_kinetic_energy_screen
    background('../images/circular_motion_large.png')

    # Angular kinetic energy screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('../images/back_icon_white.png',
                           :click => '/title_screen/circular_motion_screen')
      @heading = title('Angular kinetic energy = 0.5 x moment of inertia x angular velocity',
                       sup('2'))
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Angular kinetic energy screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Moment of inertia')
        flow do
          @moment_of_inertia = ScreenEditLine.new(self, @@font, @heading_edited)
          @moment_of_inertia_unit = para(strong(' kgm'), strong(sup('2')))
          @moment_of_inertia_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Angular velocity')
        flow do
          @angular_velocity = ScreenEditLine.new(self, @@font, @heading_edited)
          @angular_velocity_unit = para(strong(' rads'), strong(sup('-1')))
          @angular_velocity_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')
        
        @result_display = flow

        @error_display = flow
        
        @calculate.click do
          @result_display.clear do
            @result = Joules.angular_kinetic_energy(@moment_of_inertia.text.to_f,
                                                    @angular_velocity.text.to_f)
            @angular_kinetic_energy = para(@result.to_s)
            @angular_kinetic_energy_unit = para(' J')
            @angular_kinetic_energy.style(@@screen_result_text_styles)
            @angular_kinetic_energy_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
