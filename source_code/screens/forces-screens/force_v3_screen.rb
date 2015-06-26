#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ForceV3Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Force v3 screen module (force_v3_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ForceV3Screen < Shoes

  url('/title_screen/forces_screen/force_v3_screen',
      :force_v3_screen)

  # Draws the force v3 screen on the Shoes app window.
  def force_v3_screen
    @heading = 'Force = ((final velocity - initial velocity) x mass) / time'
    background('../images/forces_large.png')

    # Force v3 screen header
    ScreenHeader.new(self, '/title_screen/forces_screen', @@font, @heading)

    # Force v3 screen content
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
            @result = Joules.force_v3(@initial_velocity.text.to_f,
                                      @final_velocity.text.to_f,
                                      @mass.text.to_f,
                                      @time.text.to_f)
            @force_v3 = para(@result.to_s)
            @force_v3_unit = para(' N')
            @force_v3.style(@@screen_result_text_styles)
            @force_v3_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
