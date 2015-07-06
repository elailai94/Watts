#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ConversionsScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Conversions screen module (conversions_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

require_relative 'conversions-screens/degrees_screen.rb'
require_relative 'conversions-screens/radians_screen.rb'
require_relative 'conversions-screens/kelvins_screen.rb'

# Object definition
class ConversionsScreen < Shoes

  url('/title_screen/conversions_screen',
      :conversions_screen)

  # Draws the conversions screen on the Shoes app window.
  def conversions_screen
    @heading = 'Conversions'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("images/#{@heading_edited}_large.png")

    # Conversions screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Conversions screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Degrees' => 'Degrees = (angle × 180) / π',
           'Radians' => 'Radians = (angle × π) / 180',
           'Kelvins' => 'Kelvins = temperature + 273.15',
           'Celcius' => 'Celcius = temperature - 273.15',
           'Metres per second' => 'Metres per second = (velocity × 1000) / 3600',
           'Kilometres per hour' => 'Kilometres per hour = (velocity × 3600) / 1000'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
