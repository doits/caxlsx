module Axlsx

  # Page setup properties of the worksheet
  # This class name is not a typo, its spec.
  class PageSetUpPr

    # creates a new page setup properties object
    # @param [Hash] options
    # @option [Boolean] auto_page_breaks Flag indicating whether the sheet displays Automatic Page Breaks.
    # @option [Boolean] fit_to_page Flag indicating whether the Fit to Page print option is enabled.
    def initialize(options = {})
      options.each do |key, value|
        self.send("#{key}=",value) if self.respond_to?("#{key}=")
      end
    end

    attr_reader :auto_page_breaks
    attr_reader :fit_to_page

    # Flag indicating whether the Fit to Page print option is enabled.
    # @param [Boolean] value
    # @return [Boolean]
    def fit_to_page=(value)
      Axlsx.validate_boolean value
      @fit_to_page = value
    end

    # Flag indicating whether the sheet displays Automatic Page Breaks.
    # @param [Boolean] value
    # @return [Boolean]
    def auto_page_breaks=(value)
      Axlsx.validate_boolean value
      @auto_page_breaks = value
    end

    # serialize to xml
    def to_xml_string(str='')
      str << '<pageSetUpPr ' << serialized_attributes << '/>'
    end

    private

    def serialized_attributes
      instance_values.map { |key, value| "#{Axlsx.camel(key, false)}='#{value}'" }.join(' ')
    end
  end
end
