module ChartHelper
	def chart(type, data, opts={})
		content_tag(:div, "",
			class: type,
			id: (opts.delete(:id) || SecureRandom.uuid),
      data: {
        data: {data: data}.to_json,
        options: opts.to_json
      }
		).html_safe
	end
end
