#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ParticleAccelerationScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Particle acceleration screen module (particle_acceleration_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ParticleAccelerationScreen < Shoes

  url('/title_screen/oscillations_screen/particle_acceleration_screen',
      :particle_acceleration_screen)

  # Draws the particle acceleration screen on the Shoes app window.
  def particle_acceleration_screen
    background('images/oscillations_large.png')

    # Particle acceleration screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('images/back_icon_white.png',
                           :click => '/title_screen/oscillations_screen')
      @heading = title('Particle acceleration = - (angular velocity', sup('2'),
                       ' x displacement)')
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Particle acceleration screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Angular velocity')
        flow do
          @angular_velocity = ScreenEditLine.new(self, @@font, @heading_edited)
          @angular_velocity_unit = para(strong(' rads'), strong(sup('-1')))
          @angular_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Displacement')
        flow do
          @displacement = ScreenEditLine.new(self, @@font, @heading_edited)
          @displacement_unit = para(strong(' m'))
          @displacement_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.particle_acceleration(@angular_velocity.text.to_f,
                                                   @displacement.text.to_f)
            @particle_acceleration = para(@result.to_s)
            @particle_acceleration_unit = para(' ms', sup('-2'))
            @particle_acceleration.style(@@screen_result_text_styles)
            @particle_acceleration_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
