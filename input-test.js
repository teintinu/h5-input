var Yadda = require('yadda');
Yadda.plugins.mocha.StepLevelPlugin.init();

new Yadda.FeatureFileSearch('./test/features').each(function(file) {

  featureFile(file, function(feature) {

    var library = require('./test/library');
    var yadda = Yadda.createInstance(library);

    scenarios(feature.scenarios, function(scenario) {
      steps(scenario.steps, function(step, done) {
        yadda.run(step, done);
      });
    });
  });
});
