module TouchSupport
  def tap_element(selector)
    page.driver.execute_script "$('#{selector}').trigger('touchstart', new($.Event))"
    page.driver.execute_script "$('#{selector}').trigger('touchend', new($.Event))"
  end
end
RSpec.configure do |config|
  config.include TouchSupport
end
