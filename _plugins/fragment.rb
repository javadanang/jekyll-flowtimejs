module Jekyll
    
    class RenderFragment < Liquid::Block
    
        def render(context)
			site = context.registers[:site]
			converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
			output = converter.convert(super(context))
			"\n<div class=\"ft-fragment\">#{output}</div>\n"
        end

    end

end

Liquid::Template.register_tag('fragment', Jekyll::RenderFragment)
