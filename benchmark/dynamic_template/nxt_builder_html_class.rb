module NxtBuilder
  module Benchmark
    class DynamicTemplateNxtBuilderHtmlClass

      class Builder < NxtBuilder::HTML

        def initialize(catalog, options = {})
          super(options)
          @catalog = catalog
        end

        def render!
          # Taken from http://www.xmlfiles.com/examples/cd_catalog.xml
          html do
            body do
              ul class: "catalog" do
                @catalog.cd.each do |cd|
                  li class: "cd" do
                    p(class: "title") { text! cd.title }
                    p(class: "artist") { text! cd.artist }
                    p(class: "country") { text! cd.country }
                    p(class: "company") { text! cd.company }
                    p(class: "price") { text! cd.price }
                    p(class: "year") { text! cd.year }
                  end
                end
              end
            end
          end

          self
        end

      end

      def initialize
        @builder = Builder.new(FIXTURES[:catalog])
      end

      def run
        @builder.render!.to_s
      end
    end
  end
end