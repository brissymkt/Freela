module ApplicationHelper

	def change_language()
		url_for(:only_path => false, :locale => determine_other_language)
	end

	def environmental_types_translated()
		EnvironmentalAnalysis::VALID_TYPES.map {|value| [I18n.t('activerecord.attributes.environmental_analysis.type_of_analysis_translation.'+value), value]}
	end

	def print_hash_value(hash, selected_key)
		if hash.has_key?(selected_key)
			return hash[selected_key]
		else
			return '--'
		end
	end
	private 
	def determine_other_language
		all_locales = I18n.available_locales.map { |locale| locale.to_s }
		new_locale = [ all_locales - [params[:locale]]].first
	end
end
