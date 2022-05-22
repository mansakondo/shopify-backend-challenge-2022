# Shopify Backend Challenge 2022

A simple inventory tracking application for the [Fall 2022 - Shopify Developer Intern Challenge](https://docs.google.com/document/d/1PoxpoaJymXmFB3iCMhGL6js-ibht7GO_DkCF2elCySU/edit).

This application is hosted on [Replit](https://replit.com/@mansakondo/shopify-backend-challenge-2022?v=1) and [Heroku](https://shopify-challenge-fall-2022.herokuapp.com/).

## Main features

### Creating inventories

1. Go to the inventories index page.
2. Click on the add button.
3. Choose a name, and a base location.

### Changing the base location

1. Go to the inventories index page.
2. Click on **Edit**.
3. Select a base location.

### Adding items

1. Go to the inventories index page.
2. Select an inventory by clicking on it's name.
3. Click on the add button.
4. Choose a name, and enter the quantity for at each location.

### Keeping track of stocks at different locations

1. Go the inventories index page.
2. Select an inventory by clicking on it's name.
2. Change the location to see HOW MUCH (quantity) of WHAT (item) is stored WHERE (location).

### Adding locations

1. Go to the inventories index page.
2. Click on **Manage locations**.
3. Click on the add button.
4. Choose a name, address, city and country.

## Feature tests

WARNING: If you want to run these tests, you cannot run them on Replit since Rails needs root
privileges for that. So you need to run them on your local machine instead.

Run the system tests with:
```bash
$ bin/rails test:system
```

Use the `HEADLESS_BROWSER_MODE` environment variable to see the tests run in the browser:
```bash
$ HEADLESS_BROWSER_MODE=disabled bin/rails test:system
```
