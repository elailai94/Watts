#==============================================================================
# Watts
#
# @description: Module for providing functions to work with WavesScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Waves screen module (waves_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

require_relative 'waves-screens/wave_speed_screen.rb'
require_relative 'waves-screens/wavelength_screen.rb'
require_relative 'waves-screens/frequency_v1_screen.rb'
require_relative 'waves-screens/frequency_v2_screen.rb'

# Object definition
class WavesScreen < Shoes

  url('/title_screen/waves_screen',
      :waves_screen)

  # Draws the waves screen on the Shoes app window.
  def waves_screen
    @heading = 'Waves'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("images/#{@heading_edited}_large.png")

    # Waves screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Waves screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 1150, :width => 80) do
      end
      # Content column
      stack(:height => 1150, :width => 1000) do
        @formula_set =
          {'Wave speed' => 'Wave speed = frequency x wavelength',
           'Wavelength' => 'Wavelength = wave speed / frequency',
           'Frequency v1' => 'Frequency = wave speed / wavelength',
           'Frequency v2' => 'Frequency = 1 / time period',
           'Time period v1' => 'Time period = 1 / frequency',
           'Intensity' => 'Intensity = power / area',
           'Refractive index v1' => 'Refractive index = sine(angle of incidence) / sine(angle of refraction)',
           'Refractive index v2' => 'Refractive index = 1 / sine(critical angle)',
           'Magnification' => 'Magnification = image height / object height',
           'Focal length' => 'Focal length = 1 / ((1 / object_distance) + (1 / image_distance))',
           'Power of lens' => 'Power of lens = 1 / focal length'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
