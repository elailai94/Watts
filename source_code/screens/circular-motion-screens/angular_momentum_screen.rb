#==============================================================================
# Watts
#
# @description: Module for providing functions to work with AngularMomentumScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Angular momentum screen module (angular_momentum_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class AngularMomentumScreen < Shoes

  url('/title_screen/circular_motion_screen/angular_momentum_screen',
      :angular_momentum_screen)

  # Draws the angular momentum screen on the Shoes app window.
  def angular_momentum_screen
    background('../images/circular_motion_large.png')

    # Angular momentum screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('../images/back_icon_white.png',
                           :click => '/title_screen/circular_motion_screen')
      @heading = title('Angular momentum = moment of inertia x angular velocity')
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Angular momentum screen content
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
            @result = Joules.angular_momentum(@moment_of_inertia.text.to_f,
                                              @angular_velocity.text.to_f)
            @angular_momentum = para(@result.to_s)
            @angular_momentum_unit = para(' kgm', sup('2'), 's', sup('-1'))
            @angular_momentum.style(@@screen_result_text_styles)
            @angular_momentum_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
