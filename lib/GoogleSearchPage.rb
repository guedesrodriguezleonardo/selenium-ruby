# frozen_string_literal: true

class GoogleSearchPage
    def initialize(driver)
      @driver = driver
    end
  
    def visit
      @driver.get("https://www.google.com")
    end
  
    def searchInput
      @driver.find_element(name: "q")
    end
  
    def searchResults
      @driver.find_elements(class: "yuRUbf")
    end
  
    def search(query)
      searchInput.send_keys(query, :enter)
    end
  end