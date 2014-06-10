
namespace :bootleaf do
  namespace :assets do
    desc "Merge Bootleaf assets into project"
    task :merge do
      BOOTLEAF_ROOT = ENV['BOOTLEAF_ROOT'] || 'bootleaf'
      BOOTLEAF_ASSETS_PATH = ENV['BOOTLEAF_ASSETS_PATH'] || 'assets'
      ASSETS = [
        { :file_extension => ['.js'], :path => 'public/javascripts' },
        { :file_extension => ['.css','.css.map'], :path => 'public/stylesheets' },
        { :file_extension => ['.png','.jpg','.ico'], :path => 'public/images' },
        { :file_extension => ['.otf','.eot','.svg','.ttf','.woff','font/config.json'], :path => 'public/fonts' }
      ]
      ASSETS.each do |assets|
        assets[:file_extension].each do |file_extension|
          files = Dir.glob(File.join(BOOTLEAF_ROOT, BOOTLEAF_ASSETS_PATH, "**/*#{file_extension}"), File::FNM_CASEFOLD)
          dest = File.join(assets[:path])
          puts "Merging '#{file_extension}' assets into '#{dest}'"
          FileUtils.cp files, dest
          puts "\t#{files.size} file(s)"
        end
      end
    end
  end

  namespace :data do
    desc "Merge Bootleaf data into project"
    task :merge do
      BOOTLEAF_ROOT = ENV['BOOTLEAF_ROOT'] || 'bootleaf'
      BOOTLEAF_DATA_PATH = ENV['BOOTLEAF_DATA_PATH'] || 'data'
      DATA = [
        { :file_extension => ['.geojson'], :path => 'public/data' }
      ]
      DATA.each do |data|
        data[:file_extension].each do |file_extension|
          files = Dir.glob(File.join(BOOTLEAF_ROOT, BOOTLEAF_DATA_PATH, "**/*#{file_extension}"), File::FNM_CASEFOLD)
          dest = File.join(data[:path])
          puts "Merging '#{file_extension}' data files into '#{dest}'"
          FileUtils.cp files, dest
          puts "\t#{files.size} file(s)"
        end
      end
    end
  end
end
