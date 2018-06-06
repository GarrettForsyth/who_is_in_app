When("I fill in {string} with {min members}") do |label, value|
  (fill_in label, with: value) unless label.blank?
end

When("I fill in {string} with {string}") do |label, value|
  (fill_in label, with: value) unless label.blank?
end

When("I select {string}") do |radio|
  choose radio unless radio.blank?
end

When('I press {string}') do |btn_text|
  click_button btn_text
end

When("I select {string} from my documents in the {string} field") do |file_name, label|
  attach_file(label, Rails.root +
              "spec/fixtures/#{file_name}")
end

When("I press and confirm {string}") do |button|
  page.accept_confirm do
    click_button button
  end
end


