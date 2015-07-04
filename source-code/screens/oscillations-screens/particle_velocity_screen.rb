#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ParticleVelocityScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Particle velocity screen module (particle_velocity_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ParticleVelocityScreen < Shoes

  url('/title_screen/oscillations_screen/particle_velocity_screen',
      :particle_velocity_screen)

  # Draws the particle velocity screen on the Shoes app window.
  def particle_velocity_screen
    background('images/oscillations_large.png')

    # Particle velocity screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('images/back_icon_white.png',
                           :click => '/title_screen/oscillations_screen')
      @heading = title('Particle velocity = angular velocity x (amplitude', sup('2'),
                       ' - particle displacement', sup('2'), ')', sup('0.5'))
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Particle velocity screen content
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

        ScreenLabel.new(self, @@font, @heading_edited, 'Amplitude')
        flow do
          @amplitude = ScreenEditLine.new(self, @@font, @heading_edited)
          @amplitude_unit = para(strong(' m'))
          @amplitude_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Particle displacement')
        flow do
          @particle_displacement = ScreenEditLine.new(self, @@font, @heading_edited)
          @particle_displacement_unit = para(strong(' m'))
          @particle_displacement_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Return sign')
        flow do
          @signs = ['-', '+', '±']
          @return_sign = list_box(:width => 500,
                                  :font => @@font,
                                  :items => @signs)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.particle_velocity(@angular_velocity.text.to_f,
                                               @amplitude.text.to_f,
                                               @particle_displacement.text.to_f,
                                               @return_sign.text)
            if @return_sign.text == '±'
              @return_sign_result = para('±')
              @return_sign_result.style(@@screen_result_text_styles)
              @particle_velocity = para(@result[0].to_s)
            else
              @particle_velocity = para(@result.to_s)
            end
            @particle_velocity_unit = para(' ms', sup('-1'))
            @particle_velocity.style(@@screen_result_text_styles)
            @particle_velocity_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
