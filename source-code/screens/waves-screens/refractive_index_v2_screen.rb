#==============================================================================
# Watts
#
# @description: Module for providing functions to work with RefractiveIndexV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Refractive index v2 screen module (refractive_index_v2_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class RefractiveIndexV2Screen < Shoes

  url('/title_screen/waves_screen/refractive_index_v2_screen',
      :refractive_index_v2_screen)

  # Draws the refractive index v2 screen on the Shoes app window.
  def refractive_index_v2_screen
    @heading = 'Refractive index = 1 / sine(critical angle)'
    background('images/waves_large.png')

    # Refractive index v2 screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Refractive index v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Critical angle')
        flow do
          @critical_angle = ScreenEditLine.new(self, @@font, @heading)
          @critical_angle_unit = para(strong(' deg'))
          @critical_angle_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.refractive_index_v2(@critical_angle.text.to_f)
            @refractive_index_v2 = para(@result.to_s)
            @refractive_index_v2.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
