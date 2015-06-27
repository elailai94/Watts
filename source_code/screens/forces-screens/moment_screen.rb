#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MomentScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Moment screen module (moment_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'
require_relative '../../data_validation/data_validation.rb'

# Object definition
class MomentScreen < Shoes

  url('/title_screen/forces_screen/moment_screen',
      :moment_screen)

  # Draws the moment screen on the Shoes app window.
  def moment_screen
    @heading = 'Moment = force x distance x sine(angle)'
    background('../images/forces_large.png')

    # Moment screen header
    ScreenHeader.new(self, '/title_screen/forces_screen', @@font, @heading)

    # Moment screen content
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

        ScreenLabel.new(self, @@font, @heading, 'Distance')
        flow do
          @distance = ScreenEditLine.new(self, @@font, @heading)
          @distance_unit = para(strong(' m'))
          @distance_unit.style(@@screen_unit_text_styles)
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
              @angle_to_use = '90'
            end
            @result = Joules.moment(@force.text.to_f,
                                    @distance.text.to_f,
                                    @angle_to_use.to_f)
            @moment = para(@result.to_s)
            @moment_unit = para(' Nm')
            @moment.style(@@screen_result_text_styles)
            @moment_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
