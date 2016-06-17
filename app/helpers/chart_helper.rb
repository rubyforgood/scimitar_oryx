module ChartHelper
	def chart(type,data,id=nil)
		content_tag(:div,"", class:type,id:id||SecureRandom.uuid,"data-chart"=>data)
	end
end