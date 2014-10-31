namespace :onesky do

  desc "Upload string files of base locale to OneSky platform."
  task :upload => :environment do
    file_client.upload(locale_path)
    puts 'Done!'
  end

  desc "Download translations from OneSky platform."
  task :download => :environment do
    file_client.download(locale_path)
    puts 'Done!'
  end

  def file_client
    config = YAML.load_file(Rails.root.join('config', 'onesky.yml'))
    Onesky::Rails::FileClient.new config['api_key'], config['api_secret'], config['project_id']
  end

  def locale_path
    Rails.root.join("config/locales")
  end

end
