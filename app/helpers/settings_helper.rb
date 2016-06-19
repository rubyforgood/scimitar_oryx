module SettingsHelper
  def to_underscore(setting)
    setting.class.to_s.underscore.pluralize.downcase
  end
  
  def to_title(setting)
    setting.class.to_s.titleize
  end
end