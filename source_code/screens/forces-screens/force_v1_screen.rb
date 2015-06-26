#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ForceV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Force v1 screen module (force_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ForceV1Screen < Shoes

  url('/title_screen/forces_screen/force_v1_screen',
      :force_v1_screen)

  # Draws the force v1 screen on the Shoes app window.
  def force_v1_screen
    @heading = 'Force = mass x acceleration'
    background('../images/forces_large.png')

    # Force v1 screen header
    ScreenHeader.new(self, '/title_screen/forces_screen', @@font, @heading)

    # Force v1 screen content
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

        ScreenLabel.new(self, @@font, @heading, 'Acceleration')
        flow do
          @acceleration = ScreenEditLine.new(self, @@font, @heading)
          @acceleration_unit = para(strong(' ms'), strong(sup('-2')))
          @acceleration_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.force_v1(@mass.text.to_f,
                                      @acceleration.text.to_f)
            @force_v1 = para(@result.to_s)
            @force_v1_unit = para(' N')
            @force_v1.style(@@screen_result_text_styles)
            @force_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
