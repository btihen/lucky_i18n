I18n.backend = I18n::Backends::YAML.new.tap do |backend|
  backend.load_paths << Dir.current + "/config/locales"
  backend.load
end
