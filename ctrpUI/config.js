var helper = require('./support/setup');

exports.config = {

    framework: 'cucumber',
    //framework: 'jasmine2',

    //seleniumAddress: 'http://localhost:4444/wd/hub',

    baseUrl: 'http://ctrp-ci.nci.nih.gov/ctrp/',
    //baseUrl: process.env.UI_HOSTNAME,  //when developing tests use http://localhost:9000',

    // seleniumAddress: 'http://localhost:4444/wd/hub',
    // chromeOnly: true,
    directConnect: true,
    capabilities: {
        browserName: 'firefox',
        version: ''
    },
    restartBrowserBetweenTests: false,

    specs: [
            // Login Page
            'features/pa/regulatory_information.feature'
           ],

    getPageTimeout: 10000,

    params: {

    },


    onPrepare: function () {
      browser.manage().timeouts().setScriptTimeout(60000);
      browser.driver.manage().window().setSize(1600, 900);
    },

    framework: 'custom',
    frameworkPath: require.resolve('protractor-cucumber-framework'),
    cucumberOpts: {
        require: ['support/env.js',
                  'features/step_definitions/*.js',
                  'support/hooks.js' ],
        format: 'pretty',
        format: 'json:../results/output.json'

    }

};
