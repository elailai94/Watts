#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ForceV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Force v2 screen module (force_v2_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ForceV2Screen < Shoes

  url('/title_screen/forces_screen/force_v2_screen',
      :force_v2_screen)

  # Draws the force v2 screen on the Shoes app window.
  def force_v2_screen
    @heading = 'Force = spring constant x extension'
    background('../images/forces_large.png')

    # Force v2 screen header
    ScreenHeader.new(self, '/title_screen/forces_screen', @@font, @heading)

    # Force v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Spring constant')
        flow do
          @spring_constant = ScreenEditLine.new(self, @@font, @heading)
          @spring_constant_unit = para(strong(' Nm'), strong(sup('-1')))
          @spring_constant_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Extension')
        flow do
          @extension = ScreenEditLine.new(self, @@font, @heading)
          @extension_unit = para(strong(' m'))
          @extension_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.force_v2(@spring_constant.text.to_f,
                                      @extension.text.to_f)
            @force_v2 = para(@result.to_s)
            @force_v2_unit = para(' N')
            @force_v2.style(@@screen_result_text_styles)
            @force_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
