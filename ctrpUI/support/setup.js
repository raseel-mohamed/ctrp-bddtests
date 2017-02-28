var FirefoxProfile = require ('firefox-profile');
var q = require ('q');

exports.getFireFoxProfile = function() {
    var deferred = q.defer();
    var firefoxProfile = new FirefoxProfile();
    // var downloadPath = process.env.HOME + '/Downloads';
    var downloadPath = '/Downloads';

    firefoxProfile.setPreference('browser.download.folderList', 2);
    firefoxProfile.setPreference('browser.download.dir', downloadPath);
    firefoxProfile.setPreference('browser.download.manager.showWhenStarting', false);
    firefoxProfile.setPreference('browser. helperApps. neverAsk. openFile', 'Application/octet-stream');
    firefoxProfile.setPreference('browser.helperApps.neverAsk.saveToDisk', 'Application/octet-stream');
    firefoxProfile.encoded(function (encodedProfile) {
        var multiCapabilities = [
            {
                browserName: 'firefox',
                firefox_binary: '/Applications/Firefox.app/Contents/MacOS/firefox-bin',
                firefox_profile: encodedProfile
            },
            {
                'browserName': 'chrome',
                'chromeOptions': {
                    prefs: {
                        'download': {
                            'prompt_for_download': false,
                            'default_directory': downloadPath
                        }
                    }
                }
            }
        ];
        deferred.resolve(multiCapabilities);
    });
    return deferred.promise;
};
