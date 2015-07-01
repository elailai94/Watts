#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ElasticPotentialEnergyScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Elastic potential energy screen module (elastic_potential_energy_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ElasticPotentialEnergyScreen < Shoes

  url('/title_screen/energy_work_power_screen/elastic_potential_energy_screen',
      :elastic_potential_energy_screen)

  # Draws the elastic potential energy screen on the Shoes app window.
  def elastic_potential_energy_screen
    background('images/energy_work_power_large.png')

    # Elastic potential energy screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('images/back_icon_white.png',
                           :click => '/title_screen/energy_work_power_screen')
      @heading = title('Elastic potential energy = 0.5 x spring constant x extension',
                       sup('2'))
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Elastic potential energy screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Spring constant')
        flow do
          @spring_constant = ScreenEditLine.new(self, @@font, @heading_edited)
          @spring_constant_unit = para(strong(' Nm'), strong(sup('-1')))
          @spring_constant_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Extension')
        flow do
          @extension = ScreenEditLine.new(self, @@font, @heading_edited)
          @extension_unit = para(strong(' m'))
          @extension_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.elastic_potential_energy(@spring_constant.text.to_f,
                                                      @extension.text.to_f)
            @elastic_potential_energy = para(@result.to_s)
            @elastic_potential_energy_unit = para(' J')
            @elastic_potential_energy.style(@@screen_result_text_styles)
            @elastic_potential_energy_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
