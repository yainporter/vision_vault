# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "flowbite", to: "https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"
pin_all_from "app/javascript/controllers", under: "controllers"
