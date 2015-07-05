#==============================================================================
# Watts
#
# @description: Module for providing functions to work with HalfLifeScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Half life screen module (half_life_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class HalfLifeScreen < Shoes

  url('/title_screen/quantum_screen/half_life_screen',
      :half_life_screen)

  # Draws the half life screen on the Shoes app window.
  def half_life_screen
    @heading = 'Half life = ln(2) / decay constant'
    background('images/quantum_large.png')

    # Half life screen header
    ScreenHeader.new(self, '/title_screen/quantum_screen', @@font, @heading)

    # Half life screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Decay constant')
        flow do
          @decay_constant = ScreenEditLine.new(self, @@font, @heading)
          @decay_constant_unit = para(strong(' s'), strong(sup('-1')))
          @decay_constant_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.half_life(@decay_constant.text.to_f)
            @half_life = para(@result.to_s)
            @half_life_unit = para(' s')
            @half_life.style(@@screen_result_text_styles)
            @half_life_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
