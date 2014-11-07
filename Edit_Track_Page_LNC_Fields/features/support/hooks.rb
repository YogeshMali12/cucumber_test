require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :firefox
end




After do |scenario|
  if scenario.failed?
    # Capture the time of failure
    t = Time.now
    timestamp = t.strftime("%l_%M_%S_%p_on_%b_%e_%Y")

    # Take a screenshot, embed in the html report
    original_pwd = Dir.pwd
    changed_dir = "#{original_pwd}/build/logs"
    Dir.chdir(changed_dir) if File.directory?(changed_dir) # cd to where html is outputted
    screenshot = "./FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{timestamp}.png"
    @browser.screenshot.save(screenshot)
    embed(screenshot, "image/png") # embed path should be same directory as HTML report
    Dir.chdir(original_pwd) # back to original pwd

    # Send a runtime "scenario failed" message to STDOUT
    Kernel.puts "Scenario Failed!: #{scenario.name} @ #{t.strftime("%l:%M:%S %p on %b %e, %Y")}"
  end
end


After do
  #@browser.close
end