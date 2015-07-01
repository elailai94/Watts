#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MaximumFrictionForceScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Maximum friction force screen module (maximum_friction_force_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class MaximumFrictionForceScreen < Shoes

  url('/title_screen/forces_screen/maximum_friction_force_screen',
      :maximum_friction_force_screen)

  # Draws the maximum friction force screen on the Shoes app window.
  def maximum_friction_force_screen
    @heading = 'Maximum friction force = coefficient of friction x normal force'
    background('images/forces_large.png')

    # Maximum friction force screen header
    ScreenHeader.new(self, '/title_screen/forces_screen', @@font, @heading)

    # Maximum friction force screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Coefficient of friction')
        flow do
          @coefficient_of_friction = ScreenEditLine.new(self, @@font, @heading)
        end

        ScreenLabel.new(self, @@font, @heading, 'Normal force')
        flow do
          @normal_force = ScreenEditLine.new(self, @@font, @heading)
          @normal_force_unit = para(strong(' N'))
          @normal_force_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.maximum_friction_force(@coefficient_of_friction.text.to_f,
                                                    @normal_force.text.to_f)
            @maximum_friction_force = para(@result.to_s)
            @maximum_friction_force_unit = para(' N')
            @maximum_friction_force.style(@@screen_result_text_styles)
            @maximum_friction_force_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
