#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ParticleDisplacementScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Particle displacement screen module (particle_displacement_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ParticleDisplacementScreen < Shoes

  url('/title_screen/oscillations_screen/particle_displacement_screen',
      :particle_displacement_screen)

  # Draws the particle displacement screen on the Shoes app window.
  def particle_displacement_screen
    @heading = 'Particle displacement = amplitude x cosine(angular velocity x time)'
    background('images/oscillations_large.png')

    # Particle displacement screen header
    ScreenHeader.new(self, '/title_screen/oscillations_screen', @@font, @heading)

    # Particle displacement screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Amplitude')
        flow do
          @amplitude = ScreenEditLine.new(self, @@font, @heading)
          @amplitude_unit = para(strong(' m'))
          @amplitude_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Angular velocity')
        flow do
          @angular_velocity = ScreenEditLine.new(self, @@font, @heading)
          @angular_velocity_unit = para(strong(' rads'), strong(sup('-1')))
          @angular_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Time')
        flow do
          @time = ScreenEditLine.new(self, @@font, @heading)
          @time_unit = para(strong(' s'))
          @time_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.particle_displacement(@amplitude.text.to_f,
                                                   @angular_velocity.text.to_f,
                                                   @time.text.to_f)
            @particle_displacement = para(@result.to_s)
            @particle_displacement_unit = para(' m')
            @particle_displacement.style(@@screen_result_text_styles)
            @particle_displacement_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
