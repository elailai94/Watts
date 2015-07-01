#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MomentumScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Momentum screen module (buoyant_force_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class MomentumScreen < Shoes

  url('/title_screen/momentum_impulse_screen/momentum_screen',
      :momentum_screen)

  # Draws the momentum screen on the Shoes app window.
  def momentum_screen
    @heading = 'Momentum = mass x velocity'
    background('images/momentum_impulse_large.png')

    # Momentum screen header
    ScreenHeader.new(self, '/title_screen/momentum_impulse_screen', @@font, @heading)

    # Momentum screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Velocity')
        flow do
          @velocity = ScreenEditLine.new(self, @@font, @heading)
          @velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @velocity_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.momentum(@mass.text.to_f,
                                      @velocity.text.to_f)
            @momentum = para(@result.to_s)
            @momentum_unit = para(' Ns')
            @momentum.style(@@screen_result_text_styles)
            @momentum_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
