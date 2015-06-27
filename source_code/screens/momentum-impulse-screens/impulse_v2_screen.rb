#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ImpulseV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Impulse v2 screen module (impulse_v2_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ImpulseV2Screen < Shoes

  url('/title_screen/momentum_impulse_screen/impulse_v2_screen',
      :impulse_v2_screen)

  # Draws the impulse v2 screen on the Shoes app window.
  def impulse_v2_screen
    @heading = 'Impulse = (final velocity - initial velocity) x mass'
    background('../images/momentum_impulse_large.png')

    # Impulse v2 screen header
    ScreenHeader.new(self, '/title_screen/momentum_impulse_screen', @@font, @heading)

    # Impulse v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Initial velocity')
        flow do
          @initial_velocity = ScreenEditLine.new(self, @@font, @heading)
          @initial_velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @initial_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Final velocity')
        flow do
          @final_velocity = ScreenEditLine.new(self, @@font, @heading)
          @final_velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @final_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.impulse_v2(@initial_velocity.text.to_f,
                                        @final_velocity.text.to_f,
                                        @mass.text.to_f)
            @impulse_v2 = para(@result.to_s)
            @impulse_v2_unit = para(' Ns')
            @impulse_v2.style(@@screen_result_text_styles)
            @impulse_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
