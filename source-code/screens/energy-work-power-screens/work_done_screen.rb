#==============================================================================
# Watts
#
# @description: Module for providing functions to work with WorkDoneScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Work done screen module (work_done_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'
require_relative '../../data_validation/data_validation.rb'

# Object definition
class WorkDoneScreen < Shoes

  url('/title_screen/energy_work_power_screen/work_done_screen',
      :work_done_screen)

  # Draws the work done screen on the Shoes app window.
  def work_done_screen
    @heading = 'Work done = force x displacement x cosine(angle)'
    background('images/energy_work_power_large.png')

    # Work done screen header
    ScreenHeader.new(self, '/title_screen/energy_work_power_screen', @@font, @heading)

    # Work done screen content
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

        ScreenLabel.new(self, @@font, @heading, 'Displacement')
        flow do
          @displacement = ScreenEditLine.new(self, @@font, @heading)
          @displacement_unit = para(strong(' m'))
          @displacement_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Angle (optional)')
        flow do
          @angle = ScreenEditLine.new(self, @@font, @heading)
          @angle_unit = para(strong(' deg'))
          @angle_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            if DataValidation.is_present(@angle)
              @angle_to_use = @angle.text
            else
              @angle_to_use = '0'
            end
            @result = Joules.work_done(@force.text.to_f,
                                       @displacement.text.to_f,
                                       @angle_to_use.to_f)
            @work_done = para(@result.to_s)
            @work_done_unit = para(' J')
            @work_done.style(@@screen_result_text_styles)
            @work_done_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
