cask 'phpstorm-perpetual' do
  version '2018.1.7,181.5540.39'
  sha256 'e7ab5b82df611da5fb29796379b4ea145922a99a74f75ed257e282a781cafc63'

  url "https://download.jetbrains.com/webide/PhpStorm-#{version.before_comma}.dmg"
  appcast 'https://data.services.jetbrains.com/products/releases?code=PS&latest=true&type=release'
  name 'JetBrains PhpStorm'
  homepage 'https://www.jetbrains.com/phpstorm/'

  auto_updates false

  app 'PhpStorm.app'

  uninstall_postflight do
    ENV['PATH'].split(File::PATH_SEPARATOR).map { |path| File.join(path, 'pstorm') }.each { |path| File.delete(path) if File.exist?(path) && File.readlines(path).grep(%r{# see com.intellij.idea.SocketLock for the server side of this interface}).any? }
  end

  zap trash: [
               "~/Library/Application Support/PhpStorm#{version.major_minor}",
               "~/Library/Caches/PhpStorm#{version.major_minor}",
               "~/Library/Logs/PhpStorm#{version.major_minor}",
               "~/Library/Preferences/PhpStorm#{version.major_minor}",
               '~/Library/Preferences/jetbrains.phpstorm.*.plist',
             ]
end
