module ChartHelper
	def chart(type,data,id=nil)
		content_tag(:div, "",
			{class: type,
			id: (id || SecureRandom.uuid),
			"data-chart" => data.to_json.tr('"','\\"')},
			escape=true
		)
	end
end