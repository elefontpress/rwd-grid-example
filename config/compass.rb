if defined?(Sinatra)
  # This is the configuration to use when running within sinatra
  project_path = Sinatra::Application.root
  environment = :development
else
  # this is the configuration to use when running within the compass command line tool.
  css_dir = File.join 'public', 'stylesheets'
  relative_assets = true
  environment = :production
  output_style = :expanded
end

# This is common configuration
sass_dir = File.join 'app', 'scss'
images_dir = File.join 'static', 'images'
http_path = "/"
http_images_path = "/images"
http_stylesheets_path = "/stylesheets"