#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ImpulseV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Impulse v1 screen module (impulse_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ImpulseV1Screen < Shoes

  url('/title_screen/momentum_impulse_screen/impulse_v1_screen',
      :impulse_v1_screen)

  # Draws the impulse v1 screen on the Shoes app window.
  def impulse_v1_screen
    @heading = 'Impulse = force x time'
    background('../images/momentum_impulse_large.png')

    # Impulse v1 screen header
    ScreenHeader.new(self, '/title_screen/momentum_impulse_screen', @@font, @heading)

    # Impulse v1 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Force')
        flow do
          @force = ScreenEditLine.new(self, @@font, @heading)
          @force_unit = para(strong(' N'))
          @force_unit.style(@@screen_unit_text_styles)
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
            @result = Joules.impulse_v1(@force.text.to_f,
                                        @time.text.to_f)
            @impulse_v1 = para(@result.to_s)
            @impulse_v1_unit = para(' Ns')
            @impulse_v1.style(@@screen_result_text_styles)
            @impulse_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
