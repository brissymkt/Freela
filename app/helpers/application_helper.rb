module ApplicationHelper
	def locale_link_to(path, ids = {})
		send(path+"_#{I18n.locale.to_s.tableize.singularize}_path", ids)
	end

	def change_language()
		url_for(:only_path => false, :locale => determine_other_language)
	end


	private 
	def determine_other_language
		all_locales = I18n.available_locales.map { |locale| locale.to_s }
		new_locale = [ all_locales - [params[:locale]]].first.first.to_s
	end
end
