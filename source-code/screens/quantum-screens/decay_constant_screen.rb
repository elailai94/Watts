#==============================================================================
# Watts
#
# @description: Module for providing functions to work with DecayConstantScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Decay constant screen module (decay_constant_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class DecayConstantScreen < Shoes

  url('/title_screen/quantum_screen/decay_constant_screen',
      :decay_constant_screen)

  # Draws the decay constant screen on the Shoes app window.
  def decay_constant_screen
    @heading = 'Decay constant = ln(2) / half life'
    background('images/quantum_large.png')

    # Decay constant screen header
    ScreenHeader.new(self, '/title_screen/quantum_screen', @@font, @heading)

    # Decay constant screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Half life')
        flow do
          @half_life = ScreenEditLine.new(self, @@font, @heading)
          @half_life_unit = para(strong(' s'))
          @half_life_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.decay_constant(@half_life.text.to_f)
            @decay_constant = para(@result.to_s)
            @decay_constant_unit = para(' s', sup('-1'))
            @decay_constant.style(@@screen_result_text_styles)
            @decay_constant_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
