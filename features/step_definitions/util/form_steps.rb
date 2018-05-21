When("I fill in {string} with {string}") do |label, value|
  (fill_in label, with: value) unless label.blank?
end

When("I select {string}") do |radio|
  choose radio unless radio.blank?
end

When('I press {string}') do |btn_text|
  click_button btn_text
end

When("I select {string} from my documents") do |file_name|
  attach_file("Schedule", Rails.root +
              "spec/fixtures/#{file_name}")
end
