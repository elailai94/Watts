#==============================================================================
# Watts
#
# @description: Module for providing functions to work with KineticEnergyV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Kinetic energy v1 screen module (kinetic_energy_v1_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class KineticEnergyV1Screen < Shoes

  url('/title_screen/energy_work_power_screen/kinetic_energy_v1_screen',
      :kinetic_energy_v1_screen)

  # Draws the kinetic energy v1 screen on the Shoes app window.
  def kinetic_energy_v1_screen
    background('images/energy_work_power_large.png')

    # Kinetic energy v1 screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('images/back_icon_white.png',
                           :click => '/title_screen/energy_work_power_screen')
      @heading = title('Kinetic energy = 0.5 x mass x velocity',
                       sup('2'))
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Kinetic energy v1 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading_edited)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Velocity')
        flow do
          @velocity = ScreenEditLine.new(self, @@font, @heading_edited)
          @velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @velocity_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.kinetic_energy_v1(@mass.text.to_f,
                                               @velocity.text.to_f)
            @kinetic_energy_v1 = para(@result.to_s)
            @kinetic_energy_v1_unit = para(' J')
            @kinetic_energy_v1.style(@@screen_result_text_styles)
            @kinetic_energy_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
